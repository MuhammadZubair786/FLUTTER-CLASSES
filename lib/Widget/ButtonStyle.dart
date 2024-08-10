// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class ButtonStyleWidget extends StatelessWidget {
  var buttonLabel;
  final void Function() onPress;
  ButtonStyleWidget({super.key, this.buttonLabel, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: Colors.red,
                  ))),
          // backgroundColor: const Color.fromARGB(255, 241, 238, 238)
        ),
        label: Text(buttonLabel),
        icon: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 241, 239, 239),
            child: Icon(Icons.add_a_photo)),
        onPressed: () {
          onPress();
        },
      ),
    );
  }
}

class ButtonStyleWidget2 extends StatelessWidget {
  var buttonLabel;
  var width;
  var textStyle;
  final void Function() onPress;
  ButtonStyleWidget2(
      {super.key, this.buttonLabel, required this.onPress, this.width,this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            // If the button is pressed, return green, otherwise blue
            if (states.contains(MaterialState.pressed)) {
              return Colors.green;
            }
            return const Color.fromARGB(255, 244, 239, 239);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ))),
          // backgroundColor: const Color.fromARGB(255, 241, 238, 238)
        ),
        child: Text(buttonLabel,style:textStyle),
        onPressed: () {
          onPress();
        },
      ),
    );
  }
}
