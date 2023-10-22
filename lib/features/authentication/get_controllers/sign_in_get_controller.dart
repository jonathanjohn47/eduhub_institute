import 'package:eduhub_institute/features/dashboard/ui/DashboardScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInGetController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool obscureText = true.obs;

  void initiateLogin() {
    Get.offAll(() => DashboardScreen());
  }
}
