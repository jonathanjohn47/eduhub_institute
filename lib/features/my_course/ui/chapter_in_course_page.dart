import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

import 'youtube_videos_page.dart';

class ChaptersInCoursePage extends StatelessWidget {
  const ChaptersInCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Chapter'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => YoutubeVideosPage());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0.dp, horizontal: 8.dp),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0.dp),
                    child: Image.network(
                      'https://c.pxhere.com/images/d7/3b/2023f089c1125af2616970ec65dd-1446199.jpg!d',
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
                      'Chapter Name',
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
                      'Chapter Description',
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
        itemCount: 10,
      ),
    );
  }
}
