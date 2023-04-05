import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/const/app_color.dart';
import 'package:food_delivery/ui/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../route/route.dart';
import '../../widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _fornKey = GlobalKey<FormState>();

  final ImagePicker picker = ImagePicker();

  XFile? image;

  pickImageFromGlerry() async {
    image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    print(image!.name);
    print(image!.path);
    setState(() {});
  }

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
                    "Create a new account.",
                    style: TextStyle(
                      color: Color(0xffDC143C),
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: image == null
                      ? Center(
                          child: Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () => pickImageFromGlerry(),
                                icon: Icon(
                                  Icons.camera_alt_rounded,
                                  size: 30,
                                ),
                              )),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            File(image!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                SizedBox(
                  height: 20,
                ),
                customTextFIeld(
                  _emailController,
                  "Name",
                  "Name",
                  Icons.person_outline,
                  TextInputType.text,
                  (val) {
                    if (val!.isEmpty) {
                      return "field can't be empty";
                    } else if (val.length < 4) {
                      return "Name can't be less than 4";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                customTextFIeld(
                  _nameController,
                  "Email",
                  "Email",
                  Icons.email_outlined,
                  TextInputType.emailAddress,
                  (val) {
                    if (val!.isEmpty) {
                      return "field can't be empty";
                    } else if (val.length < 6) {
                      return "please input valid email";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                customTextFIeld(_passwordController, "password", "password",
                    Icons.password_outlined, TextInputType.text,
                    obscureText: true, (val) {
                  if (val!.isEmpty) {
                    return "field can't be empty";
                  } else if (val.length < 6) {
                    return "password can't be less than 6";
                  }
                }),
                SizedBox(
                  height: 20,
                ),
                CustomButton("Register", () {
                  if (image == null) {
                    Get.snackbar('Warning', 'Please upload an image');
                  } else if (_fornKey.currentState!.validate()) {
                    Get.toNamed(home);
                  }
                }),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Already have account? ',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    children: [
                      TextSpan(
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(login),
                          text: ' Login',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColor.button_color,
                              fontSize: 16)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
