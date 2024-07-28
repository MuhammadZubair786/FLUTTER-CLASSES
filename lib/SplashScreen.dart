// ignore_for_file: prefer_const_constructors

import 'package:ecom_app/View/Admin/Dashboard.dart';
import 'package:ecom_app/View/Auth/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), (() {
      checkUser();
      // Get.to(LoginScreen());
    }));
  }

  checkUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userCheck = prefs.getBool("Login");
    if(userCheck!){
      var userType = prefs.getString("userType");
      if(userType=="admin"){
        Get.offAll(AdminDashboard());
      }
      else{
        print("user");
        // Get.offAll(LoginScreen());
      }


    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.network(
              "https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg?t=st=1722092962~exp=1722096562~hmac=6dba715e83ca9513cc06ac9b36c21744be36b4697513fc9a230038c0a5cda43c&w=360"),
        ),
      ),
    );
  }
}
