import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:eduhub_institute/core/app_contants.dart';
import 'package:eduhub_institute/features/dashboard/ui/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInGetController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late Rx<CountryCode> countryCode;

  RxBool showLoader = false.obs;

  Future<void> initiateLogin() async {
    if (formKey.currentState!.validate()) {
      showLoader.value = true;
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: AppConstants.emailForTemporaryLogin,
              password: AppConstants.passwordForTemporaryLogin)
          .then((value) async {
        await FirebaseFirestore.instance
            .collection(AppConstants.students)
            .doc('${countryCode.value.dialCode}${phoneController.text.trim()}')
            .get()
            .then((value) async {
          FirebaseAuth.instance.signOut();
          if (value.exists) {
            await FirebaseAuth.instance.verifyPhoneNumber(
              phoneNumber:
                  '${countryCode.value.dialCode}${phoneController.text.trim()}',
              verificationCompleted: (credential) async {
                try {
                  await FirebaseAuth.instance.signInWithCredential(credential);
                  await Get.offAll(() => HomePage());
                } catch (e) {
                  Get.snackbar(
                    'Error',
                    e.toString(),
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              verificationFailed: (error) {
                Get.snackbar(
                  'Error',
                  error.message!,
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              },
              codeSent: (verificationId, [forceResendingToken]) async {
                await Get.defaultDialog(
                  title: 'Enter OTP',
                  content: Column(
                    children: [
                      TextFormField(
                        key: const Key('otp_text_field'),
                        controller: otpController,
                        decoration: const InputDecoration(
                          hintText: 'OTP',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        key: const Key('otp_submit_button'),
                        onPressed: () async {
                          try {
                            var credential = PhoneAuthProvider.credential(
                              verificationId: verificationId,
                              smsCode: otpController.text.trim(),
                            );
                            await FirebaseAuth.instance
                                .signInWithCredential(credential);
                            await Get.offAll(() => HomePage());
                          } catch (e) {
                            Get.snackbar(
                              'Error',
                              e.toString(),
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                );
              },
              codeAutoRetrievalTimeout: (verificationId) {},
            );
            showLoader.value = false;
            return;
          }
          showLoader.value = false;
          throw 'User not found';
        });
      });
    }
  }

  void checkIfAlreadyLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Get.offAll(() => HomePage());
      });
    }
  }

  @override
  void onInit() {
    countryCode = CountryCode.fromCountryCode('IN').obs;
    checkIfAlreadyLoggedIn();
    super.onInit();
  }
}
