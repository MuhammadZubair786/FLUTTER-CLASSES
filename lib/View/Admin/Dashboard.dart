// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecom_app/Controller/Admin/adminDashboardController.dart';
import 'package:ecom_app/View/Admin/DrawerData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  var controller = Get.put(AdminHomeController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getDashboradData();
    });
  }

  getDashboradData() async {
   await controller.getDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to admin Dashboard"),
      ),
      drawer: Drawer(
        child: DrawerData(),
      ),
      body: GetBuilder<AdminHomeController>(builder: (controller) {
          return  SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(5),
            child: 
            controller.isLoading ?Center(child: CircularProgressIndicator()):
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ContainerWidget(context, "Users", controller.userCount.toString()),
                    ContainerWidget(context, "Category", controller.Category.toString()),
                  ],
                ),
                Row(
                  children: [
                    ContainerWidget(context, "Dishes",controller.Dishes.toString() ),
                    ContainerWidget(context, "Pending orders", "01"),
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ContainerWidget(context, "Complete orders", "01"),
                    ContainerWidget(context, " Cancel orders ", "01"),
                  ],
                ),
                  SizedBox(height: 100,)
              ],
            ),
          ),
      
        );}
      ),
    );
  }

  Container ContainerWidget(BuildContext context, name, count) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 90, 44, 1),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              count,
              style: TextStyle(
                  color: Color.fromARGB(255, 244, 245, 244), fontSize: 25),
            ),
          ),
          Center(
            child: Text(
              name,
              style: TextStyle(
                  color: Color.fromARGB(255, 244, 245, 244), fontSize: 25),
            textAlign: TextAlign.center,
            ),
            
          ),
        ],
      ),
    );
  }
}
