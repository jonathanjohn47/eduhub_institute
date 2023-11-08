import 'package:eduhub_institute/core/app_contants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeGetController extends GetxController {
  Future<void> signInTemporarily() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: AppConstants.emailForTemporaryLogin,
        password: AppConstants.passwordForTemporaryLogin);
  }
}
