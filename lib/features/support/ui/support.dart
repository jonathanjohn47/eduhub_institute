/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Flutter UI Kit
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2021-present initappz.
*/
import 'package:eduhub_institute/features/support/get_controllers/support_get_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_colors.dart';
import '../../../helper/style.dart';

class SupportPage extends StatelessWidget {
  late BuildContext context;

  SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        // elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black45),
        title: appColorText('Customer Support'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.phone),
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildFooter(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: GetX<SupportGetController>(
            init: SupportGetController(),
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller.messages.map((msg) {
                  return !msg.sentByStudent
                      ? Container(
                          margin: EdgeInsets.only(bottom: 16),
                          width: MediaQuery.of(context).size.width - 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: AppColors.secondary.shade50
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(26),
                                        topLeft: Radius.circular(26),
                                        bottomRight: Radius.circular(26),
                                      )),
                                  child: Text(
                                    msg.text,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 16),
                              width: MediaQuery.of(context).size.width - 120,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Flexible(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(26),
                                          topLeft: Radius.circular(26),
                                          bottomLeft: Radius.circular(26),
                                        ),
                                      ),
                                      child: Text(
                                        msg.text,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                }).toList(),
              );
            }));
  }

  Widget _buildFooter() {
    return Container(
      color: AppColors.secondary.shade50.withOpacity(0.2),
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'write your message..'),
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primary,
            child: IconButton(
              icon: Icon(
                Icons.near_me,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  Item(this.side, this.msg);

  final String side;
  final String msg;
}
