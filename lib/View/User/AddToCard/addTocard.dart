import 'package:flutter/material.dart';

class AddToCard extends StatefulWidget {
  const AddToCard({super.key});

  @override
  State<AddToCard> createState() => _AddToCardState();
}

class _AddToCardState extends State<AddToCard> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Text("Add To Card "),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder:(context,index){
              return Text("Add To CARD");

          })
        ],
      ),
    );
  }
}