import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //         apiKey: "AIzaSyB2GZjqa_FbvyZT2BDO3ZfpYam2y1L",
  //         appId: "1:197845612646:android:a288ee11890c45c74e95a7",
  //         messagingSenderId: "197845612646",
  //         projectId: "crud-fa054"));
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name: "firebase_crud",
      options: FirebaseOptions(
        apiKey: "AIzaSyB2GZjqa_FbvyZT2BDO3ZfpYam2y1L",
        appId: "1:197845612646:android:a288ee11890c45c74e95a7",
        messagingSenderId: "197845612646",
        projectId: "crud-fa054",
      ),
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
