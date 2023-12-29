import 'package:eduhub_institute/models/chapter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeVideosPage extends StatelessWidget {
  const YoutubeVideosPage({super.key, required this.chapterModel});

  final ChapterModel chapterModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              launchUrl(Uri.parse(chapterModel.videosLinks[index]));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.dp, vertical: 4.dp),
              child: Row(
                children: [
                  SizedBox(
                    width: 10.dp,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            chapterModel.videosLinks[index],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                                fontSize: 12.dp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          chapterModel.videosLinks[index],
                          style: TextStyle(
                              fontSize: 12.dp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: chapterModel.videosLinks.length,
      ),
    );
  }
}
