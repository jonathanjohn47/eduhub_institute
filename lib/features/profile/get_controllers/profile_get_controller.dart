import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduhub_institute/core/app_contants.dart';
import 'package:eduhub_institute/models/student_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileGetController extends GetxController {
  Rx<StudentModel> currentStudent = StudentModel.empty().obs;

  Future<void> loadCurrentStudent() async {
    await FirebaseFirestore.instance
        .collection(AppConstants.students)
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
        .get()
        .then((value) {
      currentStudent =
          StudentModel.fromJson(jsonDecode(jsonEncode(value.data()))).obs;
    });
  }

  @override
  void onInit() {
    loadCurrentStudent();
    super.onInit();
  }
}
