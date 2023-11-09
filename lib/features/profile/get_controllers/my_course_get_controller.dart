import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduhub_institute/core/app_contants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../models/enrolled_course_model.dart';

class MyCourseGetController extends GetxController {
  RxList<EnrolledCourseModel> enrolledCourses = RxList<EnrolledCourseModel>([]);

  void getEnrolledCourses() {
    if (FirebaseAuth.instance.currentUser != null &&
        FirebaseAuth.instance.currentUser!.email !=
            AppConstants.emailForTemporaryLogin) {
      FirebaseFirestore.instance
          .collection(AppConstants.students)
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection(AppConstants.courses)
          .get()
          .then((value) {
        enrolledCourses.value =
            enrolledCourseModelFromJson(jsonEncode(value.docs));
      });
    }
  }

  @override
  void onInit() {
    getEnrolledCourses();
    super.onInit();
  }
}
