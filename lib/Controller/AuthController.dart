// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/View/Admin/Dashboard.dart';
import 'package:ecom_app/View/Auth/Login.dart';
import 'package:ecom_app/Widget/Messsage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  bool isLoading = false;
  bool password = false;

  setLoading(val) {
    isLoading = val;
    update();
  }

  setPassword(bool) {
    password = !bool;
    update();
  }


  signUpUser(email, password, name) async {
    try {
      setLoading(true);
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      var obj = {
        "name": name,
        "email": email,
        "password": password,
        "type": "user",
        "block": false
      };

      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      await users.doc(userCredential.user!.uid).set(obj);

      var uid = userCredential.user!.uid;
      print(uid);
      setLoading(false);
      ErrorMessage("Success", "User Regsister Successfully");
      Get.to(LoginScreen());
    } catch (e) {
      setLoading(false);
      ErrorMessage(
        "error",
        e.toString(),
      );
    }
  }

  setPrefernce(data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("Login", true);
    prefs.setString("userType",data["type"] );
    prefs.setString("email",data["email"] );
    prefs.setString("name",data["name"] );



  }

  LoginUser(email, password) async {
    try {
      setLoading(true);
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          var data = documentSnapshot.data() as Map;
          print('USER data: ${data["type"]}');
          if(data["block"]==true){
            ErrorMessage("Block", "Contact For Admin");

          }
        } else {
          FirebaseFirestore.instance
              .collection('admin')
              .doc(userCredential.user!.uid)
              .get()
              .then((DocumentSnapshot documentSnapshot) {
            if (documentSnapshot.exists) {
              var data = documentSnapshot.data() as Map;
              print('USER data: ${data["type"]}');
              setPrefernce(data);
              Get.offAll(AdminDashboard());
            } else {
              print('Document does not exist on the database');
            }
          });
        }
      });

      var uid = userCredential.user!.uid;
      print(uid);
      setLoading(false);
      ErrorMessage("Success", "User Login Successfully");
    } catch (e) {
      setLoading(false);
      ErrorMessage(
        "error",
        e.toString(),
      );
    }
  }
}
