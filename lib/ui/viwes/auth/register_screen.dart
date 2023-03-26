import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Register Screen",
          style: TextStyle(
              color: Color(0xffDC143C),
              fontSize: 28,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
