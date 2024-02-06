import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../core/app_contants.dart';
import '../../../models/course_model.dart';
import '../../../models/notes_model.dart';

class PreLoginGetController extends GetxController{
  RxList<CourseModel> allCourses = RxList<CourseModel>([]);
  RxList<NotesModel> allNotes = RxList<NotesModel>([]);

  RxInt currentSlideIndex = 0.obs;

  Future<void> getCourses() async {
    await FirebaseFirestore.instance
        .collection(AppConstants.courses)
        .get()
        .then((value) {
      allCourses.value = value.docs
          .map(
              (doc) => CourseModel.fromJson(jsonDecode(jsonEncode(doc.data()))))
          .toList();
    });
  }

  void getNotes() {
    FirebaseFirestore.instance
        .collection(AppConstants.notes)
        .get()
        .then((value) {
      allNotes.value = value.docs
          .map((doc) => NotesModel.fromJson(jsonDecode(jsonEncode(doc.data()))))
          .toList();
    });
  }

  @override
  void onInit() {
    getCourses();
    getNotes();
    super.onInit();
  }
}