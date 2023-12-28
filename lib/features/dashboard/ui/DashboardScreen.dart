///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:eduhub_institute/core/app_colors.dart';
import 'package:eduhub_institute/core/app_contants.dart';
import 'package:eduhub_institute/features/course_details/ui/CourseDetailPage.dart';
import 'package:eduhub_institute/features/dashboard/get_controllers/dashboard_get_controller.dart';
import 'package:eduhub_institute/features/profile/ui/profile_page.dart';
import 'package:eduhub_institute/models/student_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  DashboardGetController getController = Get.put(DashboardGetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
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
          image: AssetImage(
              'assets/images/WhatsApp_Image_2023-10-20_at_4.42.57_PM-removebg-preview.png'),
          width: 50.w,
        ),
        actions: [
          FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection(AppConstants.students)
                  .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  StudentModel currentStudent = StudentModel.fromJson(
                      jsonDecode(jsonEncode(snapshot.data!.data())));
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ProfilePage());
                    },
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(currentStudent.profilePicLink),
                    ),
                  );
                }
                return Container();
              }),
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
                  padding: EdgeInsets.all(8.0),
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
      Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Courses",
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: Color(0xff000000),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        height: 170,
        decoration: BoxDecoration(
          color: Color(0x00ffffff),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.zero,
        ),
        child: GetX<DashboardGetController>(
            init: DashboardGetController(),
            builder: (controller) {
              return ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  ...controller.allCourses
                      .map(
                        (element) => GestureDetector(
                          onTap: () {
                            Get.to(
                                () => CourseDetailPage(courseModel: element));
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                            padding: EdgeInsets.all(12),
                            width: 150,
                            height: 170,
                            decoration: BoxDecoration(
                              color: Color(0x00ffffff),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                  color: Color(0x4d9e9e9e), width: 1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.push_pin_outlined,
                                      color: Color(0xffffc000),
                                      size: 24,
                                    ),
                                    Icon(
                                      Icons.more_horiz,
                                      color: Color(0xff212435),
                                      size: 24,
                                    ),
                                  ],
                                ),
                                Image.network(
                                  element.imageLink,
                                  height: 80.dp,
                                ),
                                Text(
                                  element.name,
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              );
            }),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Text(
          "Notes",
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: Color(0xff000000),
          ),
        ),
      ),
      GetX<DashboardGetController>(
          init: DashboardGetController(),
          builder: (controller) {
            return GridView(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.6,
              ),
              children: [
                ...controller.allNotes.map((element) => Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0x00ffffff),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.push_pin_outlined,
                                color: Color(0xffffc000),
                                size: 24,
                              ),
                              Icon(
                                Icons.more_horiz,
                                color: Color(0xff212435),
                                size: 24,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                            child: Text(
                              element.name,
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              element.description,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              color: Color(0x343a57e8),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              element.categoryModel.name,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff3a57e8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            );
          }),
    ];
  }
}
