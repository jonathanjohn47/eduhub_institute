import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduhub_institute/core/app_contants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../models/course_model.dart';
import '../../../models/enrolled_course_model.dart';

class MyCourseGetController extends GetxController {
  RxList<CourseModel> enrolledCourses = RxList<CourseModel>([]);

  void getEnrolledCourses() {
    if (FirebaseAuth.instance.currentUser != null &&
        FirebaseAuth.instance.currentUser!.phoneNumber !=
            AppConstants.emailForTemporaryLogin) {
      FirebaseFirestore.instance
          .collection(AppConstants.students)
          .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
          .collection(AppConstants.enrolledCourses)
          .get()
          .then((value) {
        enrolledCourses.value = value.docs
            .map((e) => CourseModel.fromJson(jsonDecode(jsonEncode(e.data()))))
            .toList();
      });
    }
  }

  @override
  void onInit() {
    getEnrolledCourses();
    super.onInit();
  }
}
