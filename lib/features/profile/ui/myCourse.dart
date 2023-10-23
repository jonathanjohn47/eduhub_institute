/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Flutter UI Kit
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2021-present initappz.
*/

import 'package:eduhub_institute/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../helper/style.dart';

class MyCoursePage extends StatelessWidget {
  const MyCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            searchbar(),
            SizedBox(
              height: 30,
            ),
            cource(0.15, '15% Complete'),
            cource(0.55, '55% Complete'),
            cource(0.15, '15% Complete'),
          ],
        ),
      ),
    );
  }

  Widget cource(persent, text) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/images/course.jpg'),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('4.5'),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star_outline,
                          size: 20,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                    Text(
                      'Coding With Python Interface',
                      style: headText(),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Stephen Moris')
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    LinearPercentIndicator(
                      width: 150.0,
                      barRadius: Radius.circular(10),
                      lineHeight: 10.0,
                      percent: persent,
                      backgroundColor: AppColors.primary.withOpacity(0.3),
                      progressColor: AppColors.primary,
                      padding: EdgeInsets.all(0),
                    ),
                    Text(text)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
