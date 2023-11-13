/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Flutter UI Kit
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2021-present initappz.
*/

import 'package:eduhub_institute/core/app_colors.dart';
import 'package:eduhub_institute/features/authentication/ui/sign_in_page.dart';
import 'package:eduhub_institute/features/my_course/ui/chapter_in_course_page.dart';
import 'package:eduhub_institute/features/profile/get_controllers/my_course_get_controller.dart';
import 'package:eduhub_institute/models/enrolled_course_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../core/app_contants.dart';
import '../../../helper/style.dart';

class MyCoursePage extends StatelessWidget {
  const MyCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return FirebaseAuth.instance.currentUser != null &&
            FirebaseAuth.instance.currentUser!.phoneNumber !=
                AppConstants.emailForTemporaryLogin
        ? SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: GetX<MyCourseGetController>(
                  init: MyCourseGetController(),
                  builder: (controller) {
                    return Column(
                      children: [
                        searchbar(),
                        SizedBox(
                          height: 30,
                        ),
                        //cours widgets
                        ...controller.enrolledCourses
                            .map((element) => course(element))
                      ],
                    );
                  }),
            ),
          )
        : SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Please login to see your courses'),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => LoginScreen());
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text('Login'),
                )
              ],
            ),
          );
  }

  Widget course(EnrolledCourseModel enrolledCourseModel) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Get.to(() => ChaptersInCoursePage());
        },
        child: Row(
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image:
                          NetworkImage(enrolledCourseModel.courseModel.imageLink),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('4.5'),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star_outline,
                          size: 20,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                    Text(
                      enrolledCourseModel.courseModel.name,
                      style: headText(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    LinearPercentIndicator(
                      width: 150.0,
                      barRadius: Radius.circular(10),
                      lineHeight: 10.0,
                      percent: enrolledCourseModel.percentCompleted / 100,
                      backgroundColor: AppColors.primary.withOpacity(0.3),
                      progressColor: AppColors.primary,
                      padding: EdgeInsets.all(0),
                    ),
                    Text(
                      '${enrolledCourseModel.percentCompleted} % completed',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
