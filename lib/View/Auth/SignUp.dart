// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names

import 'package:ecom_app/Controller/AuthController.dart';
import 'package:ecom_app/Widget/ButtonStyle.dart';
import 'package:ecom_app/Widget/Text.dart';
import 'package:ecom_app/Widget/TextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();


  var authController = Get.put(AuthController());

  void signUp() {
    if (emailController.text.isEmpty) {
      ErrorMessage("Error", "Pleaser enter email");
    } else if (passwordController.text.isEmpty) {
      ErrorMessage("Error", "Pleaser enter Password");
    }
    else if (nameController.text.isEmpty) {
      ErrorMessage("Error", "Pleaser enter user name");
    }
     else {
      authController.signUpUser(emailController.text, passwordController.text,nameController.text);
    }
  }

  void ErrorMessage(err, message) {
    Get.snackbar(err, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        borderRadius: 20,
        borderColor: Colors.green,
        borderWidth: 3);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                TextWidget(
                  text: "Sign Up",
                  color: Colors.red,
                  fontSize: 40.0,
                  fontFamily: "FontNew",
                ),
                 TextFieldWidget(
                  hintTextdaat: "Enter Your Name",
                  controller: nameController,
                  width: MediaQuery.of(context).size.width * 0.96,
                ),
                TextFieldWidget(
                  hintTextdaat: "Enter Your Email",
                  controller: emailController,
                  width: MediaQuery.of(context).size.width * 0.96,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  hintTextdaat: "Enter Your Password",
                  controller: passwordController,
                  width: MediaQuery.of(context).size.width * 0.96,
                ),
                controller.isLoading ? 
                CircularProgressIndicator():
                ButtonStyleWidget(
                  buttonLabel: "Sign Up",
                  onPress: () {
                    signUp();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
