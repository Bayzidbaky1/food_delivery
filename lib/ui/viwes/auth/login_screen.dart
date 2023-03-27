import 'package:flutter/material.dart';
import 'package:food_delivery/ui/viwes/home_screen.dart';

import '../../../const/app_color.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _fornKey = GlobalKey<FormState>();
  final validCharacters = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28,top: 120),
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
                    if(val!.isEmpty){
                      return "field can't be empty";
                    }else if(val.length<6){
                      return "please input valid email";
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  "Password",
                  "Password",
                  Icon(Icons.remove_red_eye),
                  TextInputType.text,
                  _passwordController,
                  (val) {
                    if(val!.isEmpty){
                      return "field can't be empty";
                    }else if(val.length<6){
                      return "password can't be less than 6";
                    }
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton("Login", () {
                  if(_fornKey.currentState!.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
