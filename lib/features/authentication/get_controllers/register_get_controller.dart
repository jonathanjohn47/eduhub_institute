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

class RegisterGetController extends GetxController {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Rx<CountryCode> selectedCountry = CountryCode.fromCountryCode('IN').obs;

  Rx<String> imageLink = ''.obs;

  DateTime dateOfBirth = DateTime.now();

  RxBool isPasswordVisible = false.obs;

  RxBool isConfirmPasswordVisible = false.obs;

  Future<void> registerNewStudent() async {
    if (registerFormKey.currentState!.validate()) {
      try {
        // Create the user with email and password
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        // Upload profile picture to Firebase Storage
        UploadTask uploadTask = FirebaseStorage.instance
            .ref()
            .child(AppConstants.students)
            .child(emailController.text)
            .putFile(File(imageLink.value));

        // Finish uploading and get the download URL
        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();

        // Create the StudentModel with the necessary details
        StudentModel currentStudent = StudentModel(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          profilePicLink: downloadUrl,
          phoneNumber:
          selectedCountry.value.dialCode! + phoneNumberController.text,
          joinedOn: DateTime.now(),
          dateOfBirth: dateOfBirth,
        );

        // Save the student's data to Firestore
        await FirebaseFirestore.instance
            .collection(AppConstants.students)
            .doc(emailController.text)
            .set(currentStudent.toJson());

        // Show success message
        Get.snackbar(
          'Success',
          'Student Registered Successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (error) {
        // Show error message
        Get.snackbar(
          'Error',
          error.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  void getImage() {
    ImagePicker imagePicker = ImagePicker();

    imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        imageLink.value = value.path;
      }
    });
  }
}
