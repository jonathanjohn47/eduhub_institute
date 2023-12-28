import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

import '../../../core/app_colors.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Services",
                  style: TextStyle(
                      fontSize: 3.h,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 1.dp,
                width: 25.w,
                color: AppColors.primary,
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          _serviceTile(
              "assets/images/pixlr-image-generator-d0ec09c3-762b-48ab-96da-41ca475dfe57.png",
              "Education",
              "EduHUB is committed to delivering a comprehensive education experience that transcends traditional boundaries. Our educational services are meticulously designed to empower individuals with knowledge, skills, and a holistic learning environment."),
          _serviceTile(
              "assets/images/pixlr-image-generator-74a3a3d4-5f19-45c5-8c10-b0ef356bea7a.png",
              "Reading Library",
              "Immerse yourself in a haven of knowledge at our Reading Library. Explore an extensive collection of books, journals, and references covering a wide array of subjects, fostering a love for learning and exploration."),
          _serviceTile(
              "assets/images/pixlr-image-generator-e4b27a66-9287-4ccf-bd76-6468ae9281ab.png",
              "Consultancy",
              "Our consultancy services are dedicated to supporting and guiding you on your educational journey. Whether it’s receiving personalized insights for career decisions, exploring higher education opportunities, or fostering personal growth and life skills, our consultancy services aim to enhance your overall educational experience."),
        ],
      ),
    );
  }

  _serviceTile(String imageLink, String title, String description) {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1.dp,
                blurRadius: 2.h,
                offset: Offset(1.h, 1.h))
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.asset(
                imageLink,
                height: 30.h,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 4.h,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 2.5.h, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
