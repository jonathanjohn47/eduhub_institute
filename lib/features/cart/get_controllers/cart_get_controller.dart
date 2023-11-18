import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/app_contants.dart';
import '../../../models/course_model.dart';

class CartGetController extends GetxController {
  RxList<CourseModel> cartCourses = RxList<CourseModel>([]);

  StreamSubscription<QuerySnapshot>? cartStreamSubscription;

  void loadCartItems() {
    if (FirebaseAuth.instance.currentUser != null &&
        FirebaseAuth.instance.currentUser!.phoneNumber !=
            AppConstants.emailForTemporaryLogin) {
      cartStreamSubscription = FirebaseFirestore.instance
          .collection(AppConstants.students)
          .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
          .collection(AppConstants.cart)
          .snapshots()
          .listen((value) {
        cartCourses.value = value.docs
            .map((e) => CourseModel.fromJson(jsonDecode(jsonEncode(e.data()))))
            .toList();
      });
    }
  }

  @override
  void onInit() {
    loadCartItems();
    super.onInit();
  }

  @override
  void onClose() {
    if (cartStreamSubscription != null) {
      cartStreamSubscription?.cancel();
    }
    super.onClose();
  }
}
