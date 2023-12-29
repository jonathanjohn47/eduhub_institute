///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduhub_institute/core/app_contants.dart';
import 'package:eduhub_institute/features/course_details/get_controllers/course_details_get_controller.dart';
import 'package:eduhub_institute/models/course_model.dart';
import 'package:eduhub_institute/models/review_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

class CourseDetailPage extends StatelessWidget {
  final CourseModel courseModel;

  CourseDetailPage({super.key, required this.courseModel});

  CourseDetailsGetController courseDetailsGetController =
  Get.put(CourseDetailsGetController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [

                  ///***If you have exported images you must have to copy those images in assets/images directory.
                  Image(
                    image: NetworkImage(courseModel.imageLink),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.4,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.4,
                    decoration: BoxDecoration(
                      color: const Color(0x89000000),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.zero,
                      border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.all(0),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Color(0xff000000),
                              size: 24,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(0),
                          padding: const EdgeInsets.all(0),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xff3a57e8),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Color(0xffffffff),
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.65,
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                            child: Text(
                              courseModel.name,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 22,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              courseModel.description,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff7e7e7e),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Color(0xfff5f3f3),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.zero,
                            ),
                            child: const Text(
                              "Reviews",
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          FutureBuilder<QuerySnapshot>(
                              future: FirebaseFirestore.instance
                                  .collection(AppConstants.courses)
                                  .doc(courseModel.id)
                                  .collection(AppConstants.reviews)
                                  .get(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List<ReviewModel> reviewModels = snapshot
                                      .data!.docs
                                      .map((doc) =>
                                      ReviewModel.fromJson(
                                          jsonDecode(jsonEncode(doc.data()))))
                                      .toList();
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ...reviewModels
                                          .map((e) =>
                                          ListTile(
                                            tileColor: const Color(0x1f000000),
                                            title: Text(
                                              e.title,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.dp,
                                                color: const Color(0xff000000),
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            subtitle: Text(
                                              e.text,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12,
                                                color: Color(0xff000000),
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            dense: false,
                                            contentPadding:
                                            EdgeInsets.symmetric(
                                                horizontal: 16.0.dp),
                                            selected: false,
                                            selectedTileColor:
                                            const Color(0x42000000),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.zero,
                                              side: BorderSide(
                                                  color: const Color(0x4d9e9e9e),
                                                  width: 1.dp),
                                            ),
                                            leading: CircleAvatar(
                                              radius: 16.dp,
                                              backgroundImage: NetworkImage(
                                                  e.studentModel
                                                      .profilePicLink),
                                            ),
                                          ))
                                          .toList(),
                                    ],
                                  );
                                }
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection(AppConstants.students)
                          .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
                          .collection(AppConstants.enrolledCourses)
                          .doc(courseModel.id)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (!snapshot.data!.exists) {
                            return MaterialButton(
                              onPressed: () {
                                courseDetailsGetController.enroll(courseModel);
                              },
                              color: const Color(0xff3a57e8),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              padding: const EdgeInsets.all(16),
                              textColor: const Color(0xffffffff),
                              height: 45,
                              minWidth: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: const Text(
                                "Enroll",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            );
                          }
                          return FloatingActionButton.extended(
                            onPressed: () {},
                            label: const Text('Already Enrolled'),
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,);
                        }
                        return Container();
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
