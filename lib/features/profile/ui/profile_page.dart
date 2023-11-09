import 'package:eduhub_institute/core/app_colors.dart';
import 'package:eduhub_institute/features/authentication/ui/sign_in_page.dart';
import 'package:eduhub_institute/features/cart/ui/cart.dart';
import 'package:eduhub_institute/features/profile/get_controllers/profile_get_controller.dart';
import 'package:eduhub_institute/features/profile/ui/account.dart';
import 'package:eduhub_institute/features/profile/ui/myCourse.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_contants.dart';
import '../../../helper/style.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  ProfileGetController profileGetController = Get.put(ProfileGetController());

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null &&
            FirebaseAuth.instance.currentUser!.email !=
                AppConstants.emailForTemporaryLogin
        ? DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
                automaticallyImplyLeading: false,
                iconTheme: IconThemeData(color: Colors.black),
                title: SizedBox(
                  width: 250,
                  child: Obx(() {
                    return Text(
                      'Hi ${profileGetController.currentStudent.value.firstName} ${profileGetController.currentStudent.value.lastName}',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      softWrap: false,
                      style: headText(),
                    );
                  }),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.to(() => CartPage());
                      },
                      icon: Icon(Icons.shopping_cart_outlined))
                ],
                bottom: TabBar(
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: 'Account',
                    ),
                    Tab(
                      text: 'My Courses',
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  AccountPage(),
                  MyCoursePage(),
                ],
              ),
            ))
        : Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Please Login to Continue',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.offAll(() => LoginScreen());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10)),
                      child: Text('Login'))
                ],
              ),
            ),
          );
  }
}
