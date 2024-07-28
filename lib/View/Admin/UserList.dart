// ignore_for_file: prefer_const_constructors

import 'package:ecom_app/Controller/Admin/adminUserController.dart';
import 'package:ecom_app/View/Admin/DrawerData.dart';
import 'package:ecom_app/Widget/Text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  var userAdminController = Get.put(AdminUserController());
  void initState() {
    super.initState();
    getAllusers();
  }

  getAllusers() {
    print("all user");
    userAdminController.getAllusers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: DrawerData(),
        ),
        body: GetBuilder<AdminUserController>(builder: (controller) {
          return Column(
            children: [
              Center(
                child: TextWidget(
                  text: "Users list",
                  fontSize: 30.0,
                ),
              ),
              controller.isLoading
                  ? CircularProgressIndicator(
                      color: Colors.red,
                    )
                  : Container(),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.userList.length,
                    itemBuilder: (context,index){
                      return Card(
                        elevation: 20,
                        child: ListTile(
                          title: Text(controller.userList[index]["name"].toString()),
                        ),
                      );
                    })

            ],
          );
        }),
      ),
    );
  }
}
