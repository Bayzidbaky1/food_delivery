import 'package:flutter/material.dart';
import 'package:food_delivery/style/app_style.dart';
import 'package:food_delivery/ui/viwes/pages/bottom_fav.dart';
import 'package:food_delivery/ui/viwes/pages/bottom_home.dart';
import 'package:food_delivery/ui/viwes/pages/bottom_profile.dart';
import 'package:get/get.dart';

class BottomNavController extends StatelessWidget {
  

  List _pages = [BottomHomePage(), FavorutePage(), Profile()];

  var _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex.value,
        onTap: (value){
          _currentIndex.value = value;
        },
        items: [
        AppStyles().navItem(Icons.home_filled, 'Home'),
        AppStyles().navItem(Icons.favorite_outline, 'Favorite'),
        AppStyles().navItem(Icons.person_2_outlined, 'Profile'),
      ]),
      body: _pages[_currentIndex.value],
    ));
  }
}
