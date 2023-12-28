/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Flutter UI Kit
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2021-present initappz.
*/

import 'package:eduhub_institute/features/notifications/ui/notification-detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

import '../../../core/app_colors.dart';
import '../../../helper/style.dart' as style;
import '../get_controllers/notification_get_controller.dart';

class NotificationsPage extends StatelessWidget {
  NotificationGetController getController =
      Get.put(NotificationGetController());

  NotificationsPage({super.key});

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
        actions: [
          Obx(() {
            return Visibility(
                visible: getController.allNotifications
                    .any((element) => !element.read),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text('10', style: TextStyle(color: Colors.white)),
                ));
          })
        ],
      ),
      body:
          _buildBody(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.dp),
        child: Obx(() {
          return ListView(
            shrinkWrap: true,
            children: [
              ...getController.allNotifications
                  .map((e) => InkWell(
                        onTap: () {
                          getController.markNotificationAsRead(e);
                          Get.to(() => NotificationDetailPage(
                                notification: e,
                              ));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: style.bottomBorder(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.notificationCategory.name,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 185, 48)),
                              ),
                              SizedBox(height: 8),
                              Text(
                                e.title,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                        e.read ? null : FontWeight.bold),
                              ),
                              SizedBox(height: 2),
                              Text(e.message, style: greyText()),
                            ],
                          ),
                        ),
                      ))
                  .toList()
            ],
          );
        }),
      ),
    );
  }

  greyText() {
    return TextStyle(color: Colors.grey);
  }
}

class Item {
  Item(this.status, this.title, this.text);

  final String status;
  final String title;
  final String text;
}
