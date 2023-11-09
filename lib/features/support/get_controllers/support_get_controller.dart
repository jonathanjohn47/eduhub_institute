import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduhub_institute/core/app_contants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../models/message_model.dart';

class SupportGetController extends GetxController {
  RxList<MessageModel> messages = RxList<MessageModel>([]);

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? messageSubscription;

  Future<void> loadMessages() async {
    if (FirebaseAuth.instance.currentUser != null &&
        FirebaseAuth.instance.currentUser!.email !=
            AppConstants.emailForTemporaryLogin) {
      messageSubscription = FirebaseFirestore.instance
          .collection(AppConstants.messages)
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection(AppConstants.messages)
          .snapshots()
          .listen((value) {
        messages.value = messageModelFromJson(jsonEncode(value.docs));
      });
      messages.sort((a, b) => b.sentAt.compareTo(a.sentAt));
    }
  }

  @override
  void onInit() {
    loadMessages();
    super.onInit();
  }

  @override
  void onClose() {
    if (messageSubscription != null) {
      messageSubscription?.cancel();
    }
    super.onClose();
  }
}
