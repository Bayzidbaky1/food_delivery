import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/ui/viwes/auth/login_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';

import '../route/route.dart';
import 'auth/register_screen.dart';

class OnbordingScreen extends StatelessWidget {

  List<Introduction> list = [
    Introduction(
      title: 'Buy & Sell',
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/images/three.jpg',
    ),
    Introduction(
      title: 'Delivery',
      subTitle: 'Your order will be immediately collected and',
      imageUrl: 'assets/images/four.jpg',
    ),
    Introduction(
      title: 'Receive Money',
      subTitle: 'Pick up delivery at your door and enjoy groceries',
      imageUrl: 'assets/images/two.jpg',
    ),
    Introduction(
      title: 'Finish',
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/images/three.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IntroScreenOnboarding(
        backgroudColor: Colors.white,
        introductionList: list,
        onTapSkipButton: () {
          Get.toNamed(login); //MaterialPageRoute
        },
      ),
    );
  }
}
