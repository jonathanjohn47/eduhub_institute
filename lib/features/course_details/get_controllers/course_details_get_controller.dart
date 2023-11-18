import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduhub_institute/core/app_contants.dart';
import 'package:eduhub_institute/models/course_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseDetailsGetController extends GetxController {
  Future<void> enroll(CourseModel courseModel) async {
    await FirebaseFirestore.instance
        .collection(AppConstants.students)
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
        .collection(AppConstants.enrolledCourses)
        .doc(courseModel.id)
        .set(courseModel.toJson())
        .then((value) {
      Get.snackbar('Success', 'Enrolled Successfully',
          backgroundColor: Colors.green, colorText: Colors.white);
    });
  }
}
