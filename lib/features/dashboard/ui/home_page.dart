import 'package:eduhub_institute/core/app_colors.dart';
import 'package:eduhub_institute/features/dashboard/ui/DashboardScreen.dart';
import 'package:eduhub_institute/features/profile/ui/myCourse.dart';
import 'package:eduhub_institute/features/support/ui/support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
            children: [
              DashboardScreen(),
              MyCoursePage(),
              SupportPage(),
            ],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Image(
                  image: NetworkImage(
                      'https://cdn1.iconfinder.com/data/icons/freeline/32/home_house_real_estate-1024.png'),
                  color: AppColors.primary,
                  height: 20.dp,
                ),
                text: 'Home',
              ),
              Tab(
                icon: Image(
                  image: NetworkImage(
                      'https://cdn3.iconfinder.com/data/icons/outline-education-1/100/education-06-1024.png'),
                  color: AppColors.primary,
                  height: 20.dp,
                ),
                text: 'Courses',
              ),
              Tab(
                icon: Image(
                  image: NetworkImage(
                      'https://cdn1.iconfinder.com/data/icons/aami-web-internet/64/aami16-39-1024.png'),
                  color: AppColors.primary,
                  height: 20.dp,
                ),
                text: 'Support',
              ),
            ],
          ),
        ));
  }
}
