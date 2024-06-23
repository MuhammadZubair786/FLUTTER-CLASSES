// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:class5/Screen/Contactus.dart';
import 'package:class5/Screen/Setting.dart';
import 'package:class5/Screen/home.dart';
import 'package:flutter/material.dart';

class DrawerData extends StatefulWidget {
  const DrawerData({super.key});

  @override
  State<DrawerData> createState() => _DrawerDataState();
}

class _DrawerDataState extends State<DrawerData> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
            child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      "https://img.freepik.com/free-photo/abstract-textured-backgound_1258-30513.jpg?t=st=1719154278~exp=1719157878~hmac=b57b587b6a8c704d2807a3693c1e0430b09aa9609effcd2acdf003e4df7d81c1&w=740"),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Text(
                  "ASAD",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "asad@gmail.com",
                  style: TextStyle(color: Colors.white),
                )
              ],
              
            ),
          ),
        )
        ),
        Divider(color: Colors.red,thickness:5),
        GestureDetector(
          onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
          child: Card(
            elevation: 10,
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
          ),
        ),
         GestureDetector(
          onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ContactUs()));
          },
           child: Card(
            elevation: 10,
            child: ListTile(
              leading: Icon(Icons.contact_mail_sharp),
              title: Text("Contact"),
            ),
                 ),
         ),
         GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Setting()));
          },
           child: Card(
            elevation: 10,
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("settings"),
            ),
                 ),
         ),
         Card(
          elevation: 10,
          child: ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
        ),
         Card(
          elevation: 10,
          child: ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
          ),
        )
      ],
    );
  }
}
