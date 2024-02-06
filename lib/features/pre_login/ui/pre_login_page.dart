import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:eduhub_institute/features/authentication/ui/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_contants.dart';
import '../../../models/student_model.dart';
import '../../course_details/ui/CourseDetailPage.dart';
import '../../profile/ui/profile_page.dart';
import '../get_controllers/pre_login_get_controller.dart';

class PreLoginPage extends StatelessWidget {
  PreLoginPage({super.key});

  PreLoginGetController getController = Get.put(PreLoginGetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: /*Text(
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xfff9f9f9),
          ),
        )*/
            Image(
          image: const AssetImage(
              'assets/images/WhatsApp_Image_2023-10-20_at_4.42.57_PM-removebg-preview.png'),
          width: 50.w,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => LoginScreen());
            },
            icon: const Icon(
              Icons.login,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _sliverListItems()[index];
              },
              childCount: _sliverListItems().length,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _sliverListItems() {
    return [
      Stack(
        children: [
          CarouselSlider(
              items: [
                _carouselCard(
                    "assets/images/pixlr-image-generator-cc448eb6-84fe-438f-9275-2f230365ecc0.png",
                    "assets/icons/3586363_idea_light_lightbulb_icon.png",
                    "Empowering Minds, Shaping Futures",
                    "At EduHUB, we believe in empowering minds and shaping futures. As your dedicated partner in educational success, we provide a nurturing environment where students not only learn but also thrive. Our commitment extends beyond academic achievement, encompassing personal growth, leadership development, and the realization of individual potential."),
                _carouselCard(
                    "assets/images/pixlr-image-generator-5c287dae-e6e4-47ed-9ea3-155598ea291f.png",
                    "assets/icons/9035573_rocket_outline_icon.png",
                    "Innovative Learning for Modern Achievers",
                    "Welcome to EduHUB Institute, where knowledge meets innovation. Our futuristic approach to learning goes beyond traditional boundaries. Join a community of modern achievers who explore education with cutting-edge technology, collaborative tools, and a passion for innovation. At EduHUB, we shape the leaders of tomorrow through innovative learning experiences."),
                _carouselCard(
                    "assets/images/pixlr-image-generator-1ad22320-5606-438e-b3f0-a87acf2879e0.png",
                    "assets/icons/4243306_basic_unlock_app_ux_icon.png",
                    "Unlock Your Potential with EduHUB",
                    "Discover a transformative learning experience at EduHUB, where we unlock the full potential of students through a blend of academic excellence and comprehensive coaching for competitive exams. Our commitment to guiding and preparing students goes beyond the ordinary, ensuring success in both studies and future professional pursuits."),
              ],
              options: CarouselOptions(
                  viewportFraction: 1,
                  height: 80.h,
                  onPageChanged: (index, reason) {
                    getController.currentSlideIndex.value = index;
                  })),
          Positioned.fill(
              top: 60.h,
              child: Obx(() {
                return DotsIndicator(
                  dotsCount: 3,
                  position: getController.currentSlideIndex.value,
                  decorator: DotsDecorator(
                    color: Colors.white,
                    activeColor: AppColors.primary,
                  ),
                );
              }))
        ],
      ),
      SizedBox(
        height: 2.h,
      ),
      Container(
        color: AppColors.secondary,
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            Text(
              "About Us",
              style: TextStyle(
                  fontSize: 4.h,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            Container(
              height: 1.dp,
              width: 20.w,
              color: Colors.white,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              """EduHUB is a leading coaching institute located in the heart of the city of Temples, Jammu. Established on January 1, 2011, EduHUB has been dedicated to guiding and preparing students for academic excellence and success in competitive fields. With over 7 years of experience, EduHUB stands out among professional coaching institutes in Jammu.

We believe in a personalized approach to education, going beyond simply helping students pass exams. At EduHUB, we strive to ensure that students not only perform well academically but also gain a deep understanding of concepts, develop problem-solving skills, and master their subjects.""",
              style: TextStyle(
                  fontSize: 2.h,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 2.h,
      ),
      Container(
        padding: EdgeInsets.all(2.h),
        color: Colors.black.withOpacity(0.7),
        child: Column(
          children: [
            Text("Why Choose Us",
                style: TextStyle(
                    fontSize: 4.h,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            Container(
              height: 1.dp,
              width: 20.w,
              color: Colors.white,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
                "Our strength roots in our profound knowledge, painstaking team and zeal to care the clients in best possible way.",
                style: TextStyle(
                    fontSize: 2.h,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)),
            SizedBox(
              height: 2.h,
            ),
            CarouselSlider(
                items: [
                  _whyChooseUsCard(
                      'assets/icons/8675239_ic_fluent_people_team_regular_icon.png',
                      'Expert Guidance',
                      'Benefit from a team of seasoned educators and industry experts committed to your success. Our cutting-edge technology ensures a dynamic and immersive learning experience.'),
                  _whyChooseUsCard(
                      'assets/icons/2877000_dashboard_gauge_meter_speed_icon.png',
                      'Speed and Consistency',
                      'Our turn around times are amongst the best in the industry. We strive for consistent, timely and reliable sourcing of staff.'),
                  _whyChooseUsCard(
                      'assets/icons/8674877_ic_fluent_extended_dock_regular_icon.png',
                      'Extended Reach',
                      'We have been providing staffing solutions to our clients or students.'),
                ],
                options: CarouselOptions(
                    viewportFraction: 0.9,
                    height: 40.h,
                    enableInfiniteScroll: false)),
          ],
        ),
      ),
      SizedBox(
        height: 2.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("What We Do",
              style: TextStyle(
                fontSize: 4.h,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 1.dp,
            width: 20.w,
            color: AppColors.primary,
          ),
        ],
      ),
      SizedBox(
        height: 2.h,
      ),
      CarouselSlider(
          items: [
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
          options: CarouselOptions(
              enableInfiniteScroll: false,
              viewportFraction: 0.9,
              height: 50.h)),
      SizedBox(
        height: 2.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Testimonials",
              style: TextStyle(
                fontSize: 4.h,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 1.dp,
            width: 20.w,
            color: AppColors.primary,
          ),
        ],
      ),
      SizedBox(
        height: 2.h,
      ),
      CarouselSlider(
          items: [
            /*Choosing EduHUB for my banking exam preparation was the best decision. The experienced faculty provided clear concepts, and the regular doubt-solving sessions were immensely helpful.
Rahul Kapoor
I owe my success in the J\&K SSB exam to EduHUB Institute. The comprehensive course structure and strategic approach to each topic laid a strong foundation. The institute not only prepares you for exams but also instills confidence.
Nisha Sharma
EduHUB Institute is more than just a coaching center; it's a mentor and guide. The faculty's commitment to students' success is commendable.
Vikram Patel*/
            _testimonialCard(
                "Choosing EduHUB for my banking exam preparation was the best decision. The experienced faculty provided clear concepts, and the regular doubt-solving sessions were immensely helpful.",
                "Rahul Kapoor"),
            _testimonialCard(
                "I owe my success in the J&K SSB exam to EduHUB Institute. The comprehensive course structure and strategic approach to each topic laid a strong foundation. The institute not only prepares you for exams but also instills confidence.",
                "Nisha Sharma"),
            _testimonialCard(
                "EduHUB Institute is more than just a coaching center; it's a mentor and guide. The faculty's commitment to students' success is commendable.",
                "Vikram Patel"),
          ],
          options: CarouselOptions(
              viewportFraction: 0.9,
              height: 30.h,
              enableInfiniteScroll: false)),
      SizedBox(
        height: 2.h,
      ),
    ];
  }

  Widget _whyChooseUsCard(String iconLink, String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 5.h,
              ),
              Container(
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1.dp,
                        blurRadius: 2.h,
                        offset: Offset(1.h, 1.h))
                  ],
                ),
                padding: EdgeInsets.all(2.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(title,
                        style: TextStyle(
                            fontSize: 3.h,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    Container(
                      height: 2.dp,
                      width: 20.w,
                      color: AppColors.primary,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(description),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 0,
            left: 10.w,
            right: 10.w,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.h),
                  color: AppColors.primary,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1.dp,
                        blurRadius: 1.w,
                        offset: Offset(1.h, 1.h))
                  ],
                ),
                padding: EdgeInsets.all(2.h),
                child: Image.asset(
                  iconLink,
                  height: 6.h,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _testimonialCard(String testimonial, String name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          border: Border.all(color: Colors.black.withOpacity(0.5), width: 1.dp),
        ),
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            Text(testimonial),
            SizedBox(
              height: 2.h,
            ),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }

  _serviceTile(String imageLink, String title, String description) {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.w),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1.dp,
                blurRadius: 2.h,
                offset: Offset(1.h, 1.h))
          ],
        ),
        padding: EdgeInsets.all(2.w),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2.w), topRight: Radius.circular(10)),
              child: Image.asset(
                imageLink,
                height: 20.h,
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
                style: TextStyle(fontSize: 2.5.w, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _carouselCard(
      String imageLink, String iconLink, String title, String description) {
    return Stack(
      children: [
        Image.asset(
          imageLink,
          fit: BoxFit.cover,
          height: 80.h,
          width: 100.w,
        ),
        Positioned.fill(
            child: Container(
          color: Colors.black.withOpacity(0.5),
        )),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.all(4.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      iconLink,
                      height: 10.h,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 4.h,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 2.h,
                        offset: Offset(0.5.h, 0.5.h),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 2.h,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 2.h,
                          offset: Offset(0.5.h, 0.5.h),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
