import 'package:flutter/material.dart';
import 'package:food_delivery/ui/route/route.dart';


import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'const/app_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.app_name,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: splash,
      getPages: getPages,
    );
  }
}
