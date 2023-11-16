import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduhub_institute/models/notification_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/app_contants.dart';

class NotificationGetController extends GetxController {
  List<NotificationModel> allNotifications = <NotificationModel>[].obs;

  void loadNotifications() {
    FirebaseFirestore.instance
        .collection(AppConstants.students)
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
        .collection(AppConstants.notifications)
        .snapshots()
        .listen((event) {
      allNotifications = event.docs
          .map((e) =>
              NotificationModel.fromJson(jsonDecode(jsonEncode(e.data()))))
          .toList();
      update();
    });
  }

  Future<void> markNotificationAsRead(NotificationModel notificationModel) async {
    NotificationModel readNotification = notificationModel.copyWith(read: true);
    await FirebaseFirestore.instance
        .collection(AppConstants.students)
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
        .collection(AppConstants.notifications)
        .doc(notificationModel.id)
        .set(readNotification.toJson());
  }

  @override
  void onInit() {
    loadNotifications();
    super.onInit();
  }
}
