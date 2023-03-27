import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/ui/viwes/onbording_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../route/route.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //Splash screen duration function
  anotherScreen() {
    Future.delayed(
        Duration(seconds: 5),
        () =>Get.toNamed(onboarding) );
  }

  @override
  void initState() {
    anotherScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/splashimg.png",
              width: 200,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Food Delivery",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xffDC143C),
                  fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
