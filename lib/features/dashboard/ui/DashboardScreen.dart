///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  const DashboardScreen({super.key});

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
          Icon(Icons.search, color: AppColors.secondary, size: 22),
          SizedBox(width: 16.dp),
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
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
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
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  height: 170,
                  decoration: const BoxDecoration(
                    color: Color(0x00ffffff),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                  ),
                  child: GetX<DashboardGetController>(
                      init: DashboardGetController(),
                      builder: (controller) {
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          children: [
                            ...controller.allCourses
                                .map(
                                  (element) => GestureDetector(
                                    onTap: () {
                                      Get.to(() => CourseDetailPage(
                                          courseModel: element));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                                      padding: const EdgeInsets.all(12),
                                      width: 150,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: const Color(0x00ffffff),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                            color: const Color(0x4d9e9e9e), width: 1),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
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
                                            style: const TextStyle(
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
                const Padding(
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
                        padding: const EdgeInsets.all(16),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.6,
                        ),
                        children: [
                          ...controller.allNotes.map((element) => Container(
                                margin: const EdgeInsets.all(0),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0x00ffffff),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                      color: const Color(0x4d9e9e9e), width: 1),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
                                      child: Text(
                                        element.name,
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
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
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      decoration: BoxDecoration(
                                        color: const Color(0x343a57e8),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: Text(
                                        element.categoryModel.name,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: const TextStyle(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
