/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Flutter UI Kit
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2021-present initappz.
*/
import 'package:eduhub_institute/core/app_colors.dart';
import 'package:eduhub_institute/helper/date_time_helpers.dart';
import 'package:eduhub_institute/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../../../helper/style.dart' as style;

class NotificationDetailPage extends StatelessWidget {
  NotificationDetailPage({Key? key, Title? title, required this.notification})
      : super(key: key);
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: AppColors.primary),
        title: Text('Notifications'),
        centerTitle: false,
        titleTextStyle: style.pageTitle(),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.dp),
            child: Text(
              notification.title,
              style: TextStyle(
                fontSize: 20.dp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.dp),
          Padding(
            padding: EdgeInsets.all(8.0.dp),
            child: Text(notification.message),
          ),
          SizedBox(height: 10.dp),
          Padding(
            padding: EdgeInsets.all(8.0.dp),
            child: Text(
              notification.sentAt.getHowMuchTimeAgo,
              style: TextStyle(
                fontSize: 12.dp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
