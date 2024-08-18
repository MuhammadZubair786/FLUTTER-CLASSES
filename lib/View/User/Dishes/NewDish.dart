// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewDishPage extends StatefulWidget {
  var dishData;
   ViewDishPage({super.key,required this.dishData});

  @override
  State<ViewDishPage> createState() => _ViewDishPageState();
}

class _ViewDishPageState extends State<ViewDishPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(widget.dishData["DishName"]),
            Text(widget.dishData["DishPrice"]),
          ElevatedButton(onPressed:(){
            Navigator.pop(context);
          }, child: Text("Add To card"))
        ],
      ),
    );
  }
}