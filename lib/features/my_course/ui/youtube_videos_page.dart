import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class YoutubeVideosPage extends StatelessWidget {
  const YoutubeVideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.dp, vertical: 4.dp),
            child: Row(
              children: [
                Visibility(
                    visible: index < 5,
                    child: Image.asset(
                      'assets/icons/299110_check_sign_icon.ico',
                      height: 30.dp,
                    )),
                SizedBox(
                  width: 10.dp,
                ),
                Expanded(
                  child: Row(
                    children: [

                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
