import 'package:eduhub_institute/features/authentication/ui/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashGetController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward(from: 0).then((value) {
        Get.offAll(() => LoginScreen());
      });
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
