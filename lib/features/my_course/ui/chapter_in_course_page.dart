import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduhub_institute/core/app_contants.dart';
import 'package:eduhub_institute/models/chapter_model.dart';
import 'package:eduhub_institute/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

import 'youtube_videos_page.dart';

class ChaptersInCoursePage extends StatelessWidget {
  ChaptersInCoursePage({super.key, required this.courseModel});

  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Chapter'),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance
              .collection(AppConstants.courses)
              .doc(courseModel.id)
              .collection(AppConstants.chapters)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ChapterModel> chapters = snapshot.data!.docs
                  .map((e) =>
                      ChapterModel.fromJson(jsonDecode(jsonEncode(e.data()))))
                  .toList();
              return ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => YoutubeVideosPage(
                            chapterModel: chapters[index],
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 4.0.dp, horizontal: 8.dp),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0.dp),
                            child: Image.network(
                              chapters[index].thumbnail,
                              height: 20.h,
                              width: 100.w,
                              fit: BoxFit.cover,
                            ),
                          ),

                          Container(
                            width: 100.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0.dp),
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                          Positioned(
                            top: 4.dp,
                            left: 8.dp,
                            child: Text(
                              chapters[index].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.dp,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 6.0.dp,
                                      color: Colors.black,
                                      offset: Offset(3.0.dp, 3.0.dp),
                                    ),
                                  ]),
                            ),
                          ),
                          Positioned(
                            bottom: 4.dp,
                            left: 8.dp,
                            child: Text(
                              chapters[index].description,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.dp,
                                  fontWeight: FontWeight.w600,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 6.0.dp,
                                      color: Colors.black,
                                      offset: Offset(3.0.dp, 3.0.dp),
                                    ),
                                  ]),
                            ),
                          ),
                          //right arrow
                          Positioned(
                            right: 8.dp,
                            child: SizedBox(
                              height: 20.h,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 20.dp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: chapters.length,
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
