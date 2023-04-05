import 'package:food_delivery/ui/viwes/auth/login_screen.dart';
import 'package:food_delivery/ui/viwes/auth/register_screen.dart';
import 'package:food_delivery/ui/viwes/bottom_nav_controller.dart';
import 'package:food_delivery/ui/viwes/onbording_screen.dart';
import 'package:food_delivery/ui/viwes/pages/details_screen.dart';
import 'package:food_delivery/ui/viwes/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


const String splash = '/splash';
const String onboarding = '/onboarding';
const String login = '/login';
const String register = '/register';
const String bottomNav = '/bottomNav';
const String details= '/details';


List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),
  GetPage(name: onboarding, page: () => OnbordingScreen()),
  GetPage(name: login, page: () => LoginScreen()),
  GetPage(name: register, page: () => RegisterScreen()),
  GetPage(name: bottomNav, page: () => BottomNavController()),
  GetPage(name: details, page: () => DetailsScreen(
    data: Get.arguments,
  )),

];
