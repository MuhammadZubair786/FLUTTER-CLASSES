// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isLoading = false;

  setLoading(val) {
    isLoading = val;
    update();
  }

  void ErrorMessage(err, message) {
    Get.snackbar(err, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        borderRadius: 20,
        borderColor: err == "error" ? Colors.red : Colors.green,
        borderWidth: 3);
  }

  signUpUser(email, password) async {
    try {
      setLoading(true);
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      var uid = userCredential.user!.uid;
      print(uid);
      setLoading(false);
      ErrorMessage("Success", "User Regsister Successfully");
    } catch (e) {
        setLoading(false);
      ErrorMessage(
        "error",
        e.toString(),
      );
    }
  }
}
