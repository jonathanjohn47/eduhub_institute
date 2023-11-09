import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduhub_institute/core/app_contants.dart';
import 'package:eduhub_institute/features/dashboard/get_controllers/home_get_controller.dart';
import 'package:eduhub_institute/models/notes_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import '../../../models/course_model.dart';

class DashboardGetController extends GetxController {
  RxList<CourseModel> allCourses = RxList<CourseModel>([]);
  RxList<NotesModel> allNotes = RxList<NotesModel>([]);

  Future<void> getCourses() async {
    if (FirebaseAuth.instance.currentUser == null) {
      HomeGetController homeGetController = Get.find();

      await homeGetController.signInTemporarily().then((value) async {
        await FirebaseFirestore.instance
            .collection(AppConstants.courses)
            .get()
            .then((value) {
          allCourses.value = courseModelFromJson(jsonEncode(value.docs));
        });
      });
      FirebaseAuth.instance.signOut();
    } else {
      await FirebaseFirestore.instance
          .collection(AppConstants.courses)
          .get()
          .then((value) {
        allCourses.value = courseModelFromJson(jsonEncode(value.docs));
      });
    }
  }

  void getNotes() {
    if (FirebaseAuth.instance.currentUser == null) {
      HomeGetController homeGetController = Get.find();

      homeGetController.signInTemporarily().then((value) async {
        await FirebaseFirestore.instance
            .collection(AppConstants.notes)
            .get()
            .then((value) {
          allNotes.value = notesModelFromJson(jsonEncode(value.docs));
        });
      });
      FirebaseAuth.instance.signOut();
    } else {
      FirebaseFirestore.instance
          .collection(AppConstants.notes)
          .get()
          .then((value) {
        allNotes.value = notesModelFromJson(jsonEncode(value.docs));
      });
    }
  }

  @override
  void onInit() {
    getCourses();
    super.onInit();
  }
}