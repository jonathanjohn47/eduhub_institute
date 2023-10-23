import 'package:eduhub_institute/features/cart/ui/cart.dart';
import 'package:eduhub_institute/features/profile/ui/account.dart';
import 'package:eduhub_institute/features/profile/ui/myCourse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            iconTheme: IconThemeData(color: Colors.black),
            title: SizedBox(
              width: 250,
              child: Text(
                'Hi, Jaydeep Hirani',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
                softWrap: false,
                style: headText(),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(() => CartPage());
                  },
                  icon: Icon(Icons.shopping_cart_outlined))
            ],
            bottom: TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: 'Account',
                ),
                Tab(
                  text: 'My Courses',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              AccountPage(),
              MyCoursePage(),
            ],
          ),
        ));
  }
}
