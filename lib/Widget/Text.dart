// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  var text;
  var color;
  var fontFamily;
  var fontSize;
  var fontBold;

  TextWidget(
      {super.key,
      this.text,
      this.color,
      this.fontFamily,
      this.fontSize,
      this.fontBold = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontFamily: fontFamily, fontSize: fontSize,color: color),
    );
  }
}
