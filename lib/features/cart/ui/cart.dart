/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Flutter UI Kit
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2021-present initappz.
*/
import 'package:eduhub_institute/core/app_colors.dart';
import 'package:eduhub_institute/features/cart/get_controllers/cart_get_controller.dart';
import 'package:eduhub_institute/features/profile/get_controllers/profile_get_controller.dart';
import 'package:eduhub_institute/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/style.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppbar(),
      body: _buildBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Proceed to Checkout')),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      title: SizedBox(
        width: 250,
        child: GetX<ProfileGetController>(
            init: ProfileGetController(),
            builder: (controller) {
              return Text(
                'Hi, ${controller.currentStudent.value.firstName} ${controller.currentStudent.value.lastName}',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
                softWrap: false,
                style: headText(),
              );
            }),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GetX<CartGetController>(
          init: CartGetController(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchbar(),
                const SizedBox(
                  height: 30,
                ),
                ...controller.cartCourses.map((e) => cartItem(e)).toList(),
                Row(
                  children: [
                    const Expanded(
                      flex: 8,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Coupon Code',
                          hintStyle: TextStyle(color: Colors.black54),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.teal, elevation: 0,
                          minimumSize: const Size.fromHeight(40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Apply Now'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Subtotal'),
                    Text(
                      controller.cartCourses.isNotEmpty
                          ? '\$${controller.cartCourses.map((e) => e.price).reduce((value, element) => value + element)}'
                          : '\$0',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Shipping'), Text('Free')],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total'),
                    Text(
                      controller.cartCourses.isNotEmpty
                          ? '\$${controller.cartCourses.map((e) => e.price).reduce((value, element) => value + element)}'
                          : '\$0',
                      style: const TextStyle(
                          color: Colors.teal,
                          fontFamily: 'medium',
                          fontSize: 16),
                    )
                  ],
                ),
              ],
            );
          }),
    );
  }

  Widget cartItem(CourseModel courseModel) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(courseModel.imageLink),
                    fit: BoxFit.cover)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(courseModel.name, style: headText()),
                  Text(
                    '\$${courseModel.price}',
                    style: const TextStyle(
                        color: Colors.teal, fontSize: 18, fontFamily: 'medium'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                borderRadius: BorderRadius.circular(10)),
            child: const Column(
              children: [
                Icon(
                  Icons.remove,
                  size: 20,
                ),
                Text('1'),
                Icon(
                  Icons.add,
                  size: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
