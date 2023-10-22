import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

import '../get_controllers/splash_get_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  SplashGetController getController = Get.put(SplashGetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.dp),
          child: FadeTransition(
            opacity: getController.animationController,
            child: Image.asset(
                "assets/images/WhatsApp Image 2023-10-20 at 4.42.57 PM.jpeg"),
          ),
        ),
      ),
    );
  }
}
