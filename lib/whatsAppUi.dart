// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:testapp/Screens/GridViewList.dart';
import 'package:testapp/Screens/auth.dart';
import 'package:testapp/Screens/new.dart';

class wHATSaPPuI extends StatefulWidget {
  const wHATSaPPuI({super.key});

  @override
  State<wHATSaPPuI> createState() => _wHATSaPPuIState();
}

class _wHATSaPPuIState extends State<wHATSaPPuI> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
    
      length: 3,
      child: Scaffold(
      
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text("WhatsApp uI"),
          bottom: TabBar(
            indicatorColor: Color.fromARGB(255, 99, 5, 116),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 4,
            unselectedLabelColor: Color.fromARGB(255, 46, 45, 45),
            labelColor: const Color.fromARGB(255, 129, 12, 51),
            dividerColor: Colors.white,
            tabs: [
            Row(
              children: [
                  SizedBox(width: 10,),
                Icon(Icons.chat),
                SizedBox(width: 10,),
                Text("Chat"),
                  SizedBox(width: 10,),
              ],
            ),
            Text("Status"),
            Text("Call"),
          ]),
        ),
        body: TabBarView(
          children: [SignUpScreen(), Uicompoennets(), GridVieWLiST()],
        ),
      ),
    );
  }
}
