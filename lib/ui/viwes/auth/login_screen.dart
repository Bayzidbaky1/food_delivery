import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../const/app_color.dart';
import '../../route/route.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _fornKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28, top: 120),
          child: Form(
            key: _fornKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Welcome.",
                    style: TextStyle(
                      color: Color(0xffDC143C),
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  "Email",
                  "Email",
                  Icon(Icons.email_outlined),
                  TextInputType.emailAddress,
                  _emailController,
                  (val) {
                    if (val!.isEmpty) {
                      return "field can't be empty";
                    } else if (val.length < 6) {
                      if (val!.isEmpty) {
                        return "field can't be empty";
                      } else if (val.length < 6) {
                        return "please input valid email";
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    "Password",
                    "Password",
                    Icon(Icons.remove_red_eye),
                    TextInputType.text,
                    _passwordController, (val) {
                  if (val!.isEmpty) {
                    return "field can't be empty";
                  } else if (val.length < 6) {
                    if (val!.isEmpty) {
                      return "field can't be empty";
                    } else if (val.length < 6) {
                      return "password can't be less than 6";
                    }
                  }
                }),
                SizedBox(
                  height: 20,
                ),
                CustomButton("Login", () {
                  if (_fornKey.currentState!.validate()) {
                    Get.toNamed(home);
                  }
                }),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    children: [
                      TextSpan(
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(register),
                          text: ' Create now',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColor.button_color,
                              fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
