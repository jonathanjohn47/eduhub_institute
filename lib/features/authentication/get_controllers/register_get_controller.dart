import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';

import 'package:eduhub_institute/core/app_contants.dart';
import 'package:eduhub_institute/models/student_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../dashboard/ui/DashboardScreen.dart';

class RegisterGetController extends GetxController {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  Rx<CountryCode> selectedCountry = CountryCode.fromCountryCode('IN').obs;

  Rx<String> imageLink = ''.obs;

  DateTime dateOfBirth = DateTime.now();

  RxBool isPasswordVisible = false.obs;

  RxBool isConfirmPasswordVisible = false.obs;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  RxBool showLoader = false.obs;
  TextEditingController otpController = TextEditingController();

  late Rx<CountryCode> countryCode;

  Future<void> registerNewStudent() async {
    if (registerFormKey.currentState!.validate() &&
        imageLink.value.isNotEmpty &&
        dateOfBirthController.text.isNotEmpty) {
      showLoader.value = true;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: AppConstants.emailForTemporaryLogin,
          password: AppConstants.passwordForTemporaryLogin);
      final userDoc = await FirebaseFirestore.instance
          .collection(AppConstants.students)
          .doc(
              '${countryCode.value.dialCode}${phoneNumberController.text.trim()}')
          .get();
      await FirebaseAuth.instance.signOut();
      if (userDoc.exists) {
        Get.snackbar('Error', 'User already exists',
            backgroundColor: Colors.red, colorText: Colors.white);
      } else {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber:
              '${countryCode.value.dialCode}${phoneNumberController.text.trim()}',
          verificationCompleted: (credential) async {
            await FirebaseAuth.instance.signInWithCredential(credential);
            final storageRef = FirebaseStorage.instance
                .ref()
                .child(AppConstants.students)
                .child(
                    '${countryCode.value.dialCode}${phoneNumberController.text.trim()}');
            final uploadTask = storageRef.putFile(File(imageLink.value));
            final snapshot = await uploadTask;
            final downloadUrl = await snapshot.ref.getDownloadURL();
            await FirebaseFirestore.instance
                .collection(AppConstants.students)
                .doc(
                    '${countryCode.value.dialCode}${phoneNumberController.text.trim()}')
                .set(StudentModel(
                  firstName: firstNameController.text.trim(),
                  lastName: lastNameController.text.trim(),
                  phoneNumber:
                      '${countryCode.value.dialCode}${phoneNumberController.text.trim()}',
                  joinedOn: DateTime.now(),
                  dateOfBirth: dateOfBirth,
                  profilePicLink: downloadUrl,
                  email: emailController.text.trim(),
                ).toJson());
            Get.offAll(DashboardScreen());
          },
          verificationFailed: (error) async {},
          codeSent: (verificationId, [forceResendingToken]) async {
            Get.defaultDialog(
                title: 'Enter OTP',
                content: Column(
                  children: [
                    TextFormField(
                      key: Key('otp_text_field'),
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'OTP',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final authCredential = PhoneAuthProvider.credential(
                            verificationId: verificationId,
                            smsCode: otpController.text.trim());
                        await FirebaseAuth.instance
                            .signInWithCredential(authCredential);
                        final storageRef = FirebaseStorage.instance
                            .ref()
                            .child(AppConstants.students)
                            .child(
                                '${countryCode.value.dialCode}${phoneNumberController.text.trim()}');
                        final uploadTask =
                            storageRef.putFile(File(imageLink.value));
                        final snapshot = await uploadTask;
                        final downloadUrl = await snapshot.ref.getDownloadURL();
                        await FirebaseFirestore.instance
                            .collection(AppConstants.students)
                            .doc(
                                '${countryCode.value.dialCode}${phoneNumberController.text.trim()}')
                            .set(StudentModel(
                              firstName: firstNameController.text.trim(),
                              lastName: lastNameController.text.trim(),
                              phoneNumber:
                                  '${countryCode.value.dialCode}${phoneNumberController.text.trim()}',
                              joinedOn: DateTime.now(),
                              dateOfBirth: dateOfBirth,
                              profilePicLink: downloadUrl,
                              email: emailController.text.trim(),
                            ).toJson());
                        Get.offAll(DashboardScreen());
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ));
          },
          codeAutoRetrievalTimeout: (verificationId) async {},
        );
      }
      showLoader.value = false;
    }
  }

  void getImage() async {
    Get.dialog(AlertDialog(
      title: Text('Select Image'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? image =
                  await picker.pickImage(source: ImageSource.camera);
              if (image != null) {
                imageLink.value = image.path;
              }
            },
            leading: Icon(Icons.camera_alt),
            title: Text('Camera'),
          ),
          ListTile(
            onTap: () {
              ImagePicker picker = ImagePicker();
              picker.pickImage(source: ImageSource.gallery).then((value) {
                if (value != null) {
                  imageLink.value = value.path;
                }
              });
            },
            leading: Icon(Icons.photo),
            title: Text('Gallery'),
          ),
        ],
      ),
    ));
  }

  @override
  void onInit() {
    countryCode = CountryCode.fromCountryCode('IN').obs;
    super.onInit();
  }
}
