///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:country_code_picker/country_code_picker.dart';
import 'package:eduhub_institute/core/app_colors.dart';
import 'package:eduhub_institute/features/authentication/get_controllers/sign_in_get_controller.dart';
import 'package:eduhub_institute/features/authentication/ui/regsiter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  SignInGetController getController = Get.put(SignInGetController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //preferred size with container child and height 0
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          color: AppColors.primary,
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: getController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign In",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 24,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.dp),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: TextFormField(
                      key: const Key('sign_in_phone_text_field'),
                      controller: getController.phoneController,
                      keyboardType: TextInputType.phone,
                      obscureText: false,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                      decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                const BorderSide(color: Color(0xff9e9e9e), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                const BorderSide(color: Color(0xff9e9e9e), width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                const BorderSide(color: Color(0xff9e9e9e), width: 1),
                          ),
                          labelText: "Phone",
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            color: Color(0xff9e9e9e),
                          ),
                          filled: true,
                          fillColor: const Color(0x00ffffff),
                          isDense: false,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          prefixIcon: CountryCodePicker(
                            onChanged: (value) {
                              getController.countryCode.value = value;
                            },
                            initialSelection: 'IN',
                            favorite: const ['+91', 'IN'],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter phone';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15.dp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Obx(() {
                          return !getController.showLoader.value
                              ? MaterialButton(
                                  key: const Key('sign_in_button'),
                                  onPressed: () {
                                    getController
                                        .initiateLogin()
                                        .catchError((error) => Get.snackbar(
                                              'Error',
                                              error.toString(),
                                              snackPosition: SnackPosition.TOP,
                                              backgroundColor: Colors.red,
                                              colorText: Colors.white,
                                            ));
                                  },
                                  color: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0.dp),
                                  ),
                                  elevation: 1.h,
                                  child: const Text(
                                    "Send OTP",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                  ),
                                )
                              : const Center(child: CircularProgressIndicator());
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.dp),
                  GestureDetector(
                    key: const Key('sign_up_button'),
                    onTap: () {
                      Get.offAll(() => RegisterScreen());
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Color(0xff000000),
                            ),
                          ),
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: Colors.cyan,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
