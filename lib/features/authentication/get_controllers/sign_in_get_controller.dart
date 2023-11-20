import 'package:country_code_picker/country_code_picker.dart';
import 'package:eduhub_institute/features/dashboard/ui/DashboardScreen.dart';
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
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber:
        '${countryCode.value.dialCode}${phoneController.text.trim()}',
        verificationCompleted: (credential) async {
          try {
            // The signInWithPhon`eCredential method call should be awaited.
            await FirebaseAuth.instance.signInWithCredential(credential);
            // Navigation should be awaited if it returns a Future.
            await Get.offAll(() => const DashboardScreen());
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
          // Dialog display doesn't usually return a Future, so not awaiting is correct.
          Get.defaultDialog(
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
                          smsCode: otpController.text.trim());
                      // signInWithCredential is the correct function to be called with a created PhoneAuthCredential.
                      await FirebaseAuth.instance.signInWithCredential(credential);
                      await Get.offAll(() => const DashboardScreen());
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
    }
  }

  void checkIfAlreadyLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Get.offAll(() => const DashboardScreen());
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
