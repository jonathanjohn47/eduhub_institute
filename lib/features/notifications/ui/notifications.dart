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
import 'package:get/get.dart';

import '../../../core/app_colors.dart';
import '../../../helper/style.dart' as style;

class NotificationsPage extends StatelessWidget {
  List<Item> notifications = <Item>[
    Item('Promo', 'You get 10% off from your last order',
        'The gift can you use in next order'),
    Item('Transaction', 'Waiting for payment',
        'The gift can you use in next order'),
    Item('Info', 'Rate your order experience',
        'Give rating to increase our service'),
    Item('Promos', 'Bananas day!', 'Get 5% off to all banana'),
  ];

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
      ),
      body:
          _buildBody(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: List.generate(notifications.length, (index) {
            return InkWell(
              onTap: () {
                Get.to(() => NotificationDetailPage());
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                margin: EdgeInsets.only(bottom: 16),
                decoration: style.bottomBorder(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notifications[index].status,
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 185, 48)),
                    ),
                    SizedBox(height: 8),
                    Text(
                      notifications[index].title,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 2),
                    Text(notifications[index].text, style: greyText()),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  greyText() {
    return TextStyle(color: Colors.grey);
  }
}

class Item {
  const Item(this.status, this.title, this.text);

  final String status;
  final String title;
  final String text;
}
