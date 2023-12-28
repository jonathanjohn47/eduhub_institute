import 'package:eduhub_institute/core/app_colors.dart';
import 'package:eduhub_institute/features/about/ui/about_page.dart';
import 'package:eduhub_institute/features/dashboard/get_controllers/home_get_controller.dart';
import 'package:eduhub_institute/features/dashboard/ui/DashboardScreen.dart';
import 'package:eduhub_institute/features/profile/ui/myCourse.dart';
import 'package:eduhub_institute/features/services/ui/services_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomeGetController homeGetController = Get.put(HomeGetController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: const TabBarView(
            children: [
              DashboardScreen(),
              MyCoursePage(),
              AboutPage(),
              ServicesPage()
            ],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Image(
                  image: const AssetImage(
                      'assets/icons/392500_estate_home_house_real_icon.png'),
                  color: AppColors.primary,
                  height: 20.dp,
                ),
                text: 'Home',
              ),
              Tab(
                icon: Image(
                  image: const AssetImage(
                      'assets/icons/2205242_college_course_degree_education_university_icon.png'),
                  color: AppColors.primary,
                  height: 20.dp,
                ),
                text: 'Courses',
              ),
              Tab(
                icon: Image(
                  image: const AssetImage(
                      'assets/icons/7628371_about_information_info_help_icon.png'),
                  color: AppColors.primary,
                  height: 20.dp,
                ),
                text: 'About Us',
              ),Tab(
                icon: Image(
                  image: const AssetImage(
                      'assets/icons/7898531_services_business_finance_office_marketing_icon.png'),
                  color: AppColors.primary,
                  height: 20.dp,
                ),
                text: 'Services',
              ),
            ],
          ),
        ));
  }
}
