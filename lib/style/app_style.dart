import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStyles {
  //progresss bar
  progressDialog(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Image.asset(
              "assets/file/tenor.gif",
              height: 150,
            ),
          );
        });
  }

  //faild snackbar msg
  GetSnackBar faildSnackBar(message) => GetSnackBar(
        message: message,
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
        icon: Icon(Icons.warning_amber_rounded),
      );

  //success snackbar msg
  GetSnackBar successSnackBar(message) => GetSnackBar(
        message: message,
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        icon: Icon(Icons.done),
      );

      // bottom nav item

BottomNavigationBarItem navItem(icon, title) =>
    BottomNavigationBarItem(icon: Icon(icon), label: title);
}


