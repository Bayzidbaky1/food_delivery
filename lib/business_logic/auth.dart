import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_delivery/ui/route/route.dart';
import 'package:get/get.dart';
import '../style/app_style.dart';

class Auth {
  uploadImageToStorage(image, context, userName, email, password) async {
    
    try {
      AppStyles().progressDialog(context);
      File imageFile = File(image.path);
      FirebaseStorage storage = FirebaseStorage.instance;
      UploadTask uploadTask =
          storage.ref('profile-images').child(image.name).putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;
      String imgUrl = await snapshot.ref.getDownloadURL();
      Get.back();
      registration(
          userName, email, password, imgUrl); //pass those parameter on database
      // print(imgUrl);
      // print(userName);
      // print(email);
      // print(password);
    } catch (e,s) {
      print(e);
      print(s);
      Get.back();
      Get.showSnackbar(AppStyles().faildSnackBar('Something Wrong'));
    }
  }

  registration(userName, email, password, imgUrl) async {
    print(imgUrl);
      print(userName);
      print(email);
      print(password);
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var authCredential = credential.user;
      if (authCredential!.uid.isNotEmpty) {
        Get.back();
        Get.showSnackbar(
            AppStyles().successSnackBar('Registration successfully'));
        Get.toNamed(bottomNav);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.back();
        Get.showSnackbar(
            AppStyles().faildSnackBar('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        Get.back();
        Get.showSnackbar(AppStyles()
            .faildSnackBar('The account already exists for that email.'));
      }
    } catch (e,s) {
      print(e);
      print(s);
      Get.back();
      Get.showSnackbar(AppStyles()
          .faildSnackBar('Something Went wrong'));
    }
  }

  login() {}
}
