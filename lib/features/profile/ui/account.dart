/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Flutter UI Kit
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2021-present initappz.
*/

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduhub_institute/features/notifications/ui/notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_contants.dart';
import '../../../helper/style.dart';
import '../../../models/student_model.dart';
import '../../authentication/ui/sign_in_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

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
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            searchbar(),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
              child: FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection(AppConstants.students)
                      .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      StudentModel currentStudent = StudentModel.fromJson(
                          jsonDecode(jsonEncode(snapshot.data!.data())));
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(currentStudent.profilePicLink),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${currentStudent.firstName} ${currentStudent.lastName}',
                            style: headText(),
                          ),
                          Text(
                            currentStudent.phoneNumber,
                            style: const TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          bottomFields(Icons.insert_drive_file_outlined,
                              'Payment History', () {}),
                          bottomFields(
                              Icons.notifications_outlined, 'Notifications',
                              () {
                            Get.to(() => NotificationsPage());
                          }),
                          bottomFields(
                              Icons.help_outline, 'Help & Support', () {}),
                          bottomFields(
                              Icons.settings_outlined, 'Settings', () {}),
                          bottomFields(Icons.logout_outlined, 'Logout', () {
                            FirebaseAuth.instance.signOut().then((value) {
                              Get.offAll(() => LoginScreen());
                            });
                          }),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomFields(icon, text, Function() onPressed) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.teal,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
