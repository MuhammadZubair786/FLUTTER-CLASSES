// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  var width;
  var placeholder;
  var hintTextdaat;
  var passwordField;
  var suffixIcon ;
  TextEditingController controller;
    final void Function()? onPress;
    var show;
   TextFieldWidget({super.key,required this.controller,this.width,this.placeholder,this.hintTextdaat,
   this.passwordField,
    this.onPress,
    this.show,
    this.suffixIcon
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:10),
      width: width,
      child: TextField(
        obscureText: passwordField==true?show:false,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon:
          suffixIcon != null &&
           passwordField == true ? 
          GestureDetector(
            onTap: (){
              onPress!();
            },
            child: suffixIcon) :suffixIcon == null ?null :suffixIcon,
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
