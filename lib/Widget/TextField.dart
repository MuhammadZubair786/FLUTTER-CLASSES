// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  var width;
  var placeholder;
  var hintTextdaat;
  TextEditingController controller;
   TextFieldWidget({super.key,required this.controller,this.width,this.placeholder,this.hintTextdaat});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:10),
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintTextdaat,
          helperText: placeholder,
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.red),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.red),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
