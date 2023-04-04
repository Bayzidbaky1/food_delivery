import 'package:food_delivery/ui/viwes/auth/login_screen.dart';
import 'package:food_delivery/ui/viwes/auth/register_screen.dart';
import 'package:food_delivery/ui/viwes/home_screen.dart';
import 'package:food_delivery/ui/viwes/onbording_screen.dart';
import 'package:food_delivery/ui/viwes/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


const String splash = '/splash';
const String onboarding = '/onboarding';
const String login = '/login';
const String register = '/register';
const String home = '/home';

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),
  GetPage(name: onboarding, page: () => OnbordingScreen()),
  GetPage(name: login, page: () => LoginScreen()),
  GetPage(name: register, page: () => RegisterScreen()),
  GetPage(name: home, page: () => HomeScreen()),
];
