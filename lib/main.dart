// ignore_for_file: prefer_const_constructors

import 'package:ecom_app/SplashScreen.dart';
import 'package:ecom_app/View/Auth/Login.dart';
import 'package:ecom_app/View/Auth/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:SplashScreen(),
    );
  }
}

