import 'package:flutter/material.dart';
import 'package:get/get.dart';

void ErrorMessage(err, message) {
  Get.snackbar(err, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      borderRadius: 20,
      borderColor: err == "error" ? Colors.red : Colors.green,
      borderWidth: 3);
}
