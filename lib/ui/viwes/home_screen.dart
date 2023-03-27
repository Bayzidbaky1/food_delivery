import 'package:flutter/material.dart';
import 'package:food_delivery/const/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Home",
              style: TextStyle(
                  color: AppColor.button_color,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
          )
        ],
      ),
    );
  }
}
