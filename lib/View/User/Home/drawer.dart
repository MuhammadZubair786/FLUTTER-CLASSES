// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecom_app/View/Admin/Dashboard.dart';
import 'package:ecom_app/View/Admin/Dish/dish.dart';
import 'package:ecom_app/View/Admin/UserList.dart';
import 'package:ecom_app/View/Admin/category.dart';
import 'package:ecom_app/View/Auth/Login.dart';
import 'package:ecom_app/View/User/AddToCard/addTocard.dart';
import 'package:ecom_app/View/User/Dishes/dish.dart';
import 'package:ecom_app/View/User/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerData extends StatefulWidget {
  const DrawerData({super.key});

  @override
  State<DrawerData> createState() => _DrawerDataState();
}

class _DrawerDataState extends State<DrawerData> {
  var name = "";
  var email = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name")!;
    email = prefs.getString("email")!;

    setState(() {});
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(LoginScreen());


  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
            child: Container(
          width: 300.0,
          height: 500.0,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
                "https://media.istockphoto.com/vectors/dark-abstract-background-vector-illustration-vector-id929619614?b=1&k=6&m=929619614&s=612x612&w=0&h=bzXWUYZ7R9wMSTmWANhfhh2ct3RAnOBVKMhqLDE1KiY="),
            // fit: BoxFit.cover
          )),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon((Icons.supervised_user_circle_rounded)),
                color: Colors.white,
                iconSize: 60,
                onPressed: () {},
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    email.toString(),
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )
            ],
          )),
        )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              child: (Row(
                children: <Widget>[
                  // ...
                  Expanded(
                    child: Column(
                      children: <Widget>[Divider(color: Colors.black)],
                    ),
                  )
                ],
              )),
            ),
            GestureDetector(
              onTap: () {
                Get.to(UserDashboard());
              },
              child: ListTile(
                  leading: IconButton(
                    icon: Icon((Icons.home)),
                    color: Colors.red,
                    iconSize: 30,
                    onPressed: () {},
                  ),
                  title: Text("Home")),
            ),
             GestureDetector(
              onTap: () {
                Get.to(AddToCard());
              },
              child: ListTile(
                  leading: IconButton(
                    icon: Icon((Icons.home)),
                    color: Colors.red,
                    iconSize: 30,
                    onPressed: () {},
                  ),
                  title: Text("ADD tO cARD dATA")),
            ),
           
            ListTile(
                leading: IconButton(
                  icon: Icon((Icons.login_outlined)),
                  color: Colors.red,
                  iconSize: 30,
                  onPressed: () {
                    logout();
                  },
                ),
                title: Text("Log Out")),
          ],
        ),
        // GestureDetector(onTap: (){},child:ListTile(title:Text("hello"))),  //GestureDetector used for Drawer move one page to other
      ],
    );
  }
}
