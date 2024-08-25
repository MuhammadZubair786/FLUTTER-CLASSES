// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecom_app/Controller/userController/addtoCardController.dart';
import 'package:ecom_app/View/User/Home/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class AddToCard extends StatefulWidget {
  const AddToCard({super.key});

  @override
  State<AddToCard> createState() => _AddToCardState();
}

class _AddToCardState extends State<AddToCard> {

  var controller = Get.put(AddToCardController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((data){
    getAddToCard();
    });
  }

getAddToCard(){
  print(controller.userCard.toList());

}

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        drawer: Drawer(child: DrawerData(),),
        appBar: AppBar(
          title:   Text("Add To Card "),
        ),
        body:GetBuilder<AddToCardController>(builder: (controller) {
          return Column(
            children: [
            
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.userCard.length,
                itemBuilder:(context,index){
                  var price = int.parse( controller.userCard[index]["DishPrice"])*controller.userCard[index]["quantity"];
                  return Card(
                    child: Container(
                      margin: EdgeInsets.all(1),
                      child: ListTile(
          
                        leading:CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(controller.userCard[index]["DishImage"])) ,
                        title: Text(controller.userCard[index]["DishName"]),
                        subtitle: Text(
                       price.toString()),
                        trailing: Wrap(
                          children:[
                             GestureDetector(
                              onTap: () async {
                              await  controller.updateCard(index,"inc");
                            
                              },
                              child: CircleAvatar(child: Icon(Icons.add))),
                             SizedBox(width: 5,),
                             Text(controller.userCard[index]["quantity"].toString(),style: TextStyle(fontSize: 25),),
                             SizedBox(width: 5,),
          
                             GestureDetector(
                              onTap: () async {
                              await  controller.updateCard(index,"dec");
         
                              },
                              child: CircleAvatar(child: Icon(Icons.remove))),
                             
          
                             ]
                        ),
                        // trailing: Row(
                        //   children: [
                        //     Icon(Icons.add)
                        //   ],
                        // ),
                      ),
                    ),
                  );
                
              }),
              ElevatedButton(onPressed: (){}, child:Text("Order Now"))
            ],
          );}
        ),
      ),
    );
  }
}