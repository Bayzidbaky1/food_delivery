import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../route/route.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();

  //Splash screen duration function
  anotherScreen() {
    var value = box.read("checked");
    print(value);

    if (value == true) {
      Get.toNamed(bottomNav);
    } else {
      Get.toNamed(onboarding);
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () => anotherScreen());
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
