// ignore_for_file: prefer_const_constructors

import 'package:ecom_app/Widget/ButtonStyle.dart';
import 'package:ecom_app/Widget/Text.dart';
import 'package:ecom_app/Widget/TextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/AuthController.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var authController = Get.put(AuthController());
  var bool = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                TextWidget(
                  text: "LOGIN",
                ),
                TextFieldWidget(
                  passwordField: false,
                  hintTextdaat: "Enter Your Email",
                  controller: emailController,
                  width: MediaQuery.of(context).size.width * 0.96,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  passwordField: true,
                  show: controller.password,
                  onPress: () {
                    controller.setPassword(controller.password);
                  },
                  hintTextdaat: "Enter Your Password",
                  controller: passwordController,
                  width: MediaQuery.of(context).size.width * 0.96,
                ),
                SizedBox(
                  height: 20,
                ),
                controller.isLoading ? CircularProgressIndicator():
                ButtonStyleWidget(
                  onPress: () {
                   controller.LoginUser(emailController.text,passwordController.text);
                  },
                  buttonLabel: "Login ",
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
