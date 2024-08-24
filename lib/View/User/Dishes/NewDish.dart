// ignore_for_file: prefer_const_constructors

import 'package:ecom_app/Controller/userController/addtoCardController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewDishPage extends StatefulWidget {
  var dishData;
  ViewDishPage({super.key, required this.dishData});

  @override
  State<ViewDishPage> createState() => _ViewDishPageState();
}

class _ViewDishPageState extends State<ViewDishPage> {
  var controller = Get.put(AddToCardController());
  var status = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // getBackData();
      checkDish();
    });
  }



  checkDish() async {

    var res = await controller.checkCard(widget.dishData);
   status = res;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(widget.dishData["DishName"]),
          Text(widget.dishData["DishPrice"]),
          ElevatedButton(
              onPressed: () {
                controller.userAddToCard(widget.dishData);
                Get.snackbar("Success", "New item Add TO CARD ");
                Navigator.pop(context);
              },
              child: status ? Text("Remove from card"): Text("Add To card"))
        ],
      ),
    );
  }
}
