import 'package:firebase_crud/homescreen.dart';
import 'package:firebase_crud/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? loginUid = await prefs.getString('loginUid');

      // bool? isLoggedIn = await prefs.getBool("isLoggedIn");

      // Get.off(LoginScreen());
      loginUid == "" ? Get.off(() => HomeScreen()) : Get.off(() => LoginScreen());
    });

    return Scaffold(
      body: Center(
        child: Container(
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
