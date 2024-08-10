// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:ecom_app/View/Admin/DrawerData.dart';
import 'package:ecom_app/Widget/ButtonStyle.dart';
import 'package:ecom_app/Widget/TextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../Controller/Admin/AdminCategoryController.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  var CategoryController = TextEditingController();
  var controller = Get.put(AdminCategoryController());

  var edittext = TextEditingController();
  var selectedindex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCategories();
  }

  getAllCategories() {
    controller.getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: DrawerData(),
        ),
        body: GetBuilder<AdminCategoryController>(builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Add Category"),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      passwordField: false,
                      // suffixIcon: Icon(Icons.email),
                      hintTextdaat: "Enter Your Category",
                      controller: CategoryController,
                      width: MediaQuery.of(context).size.width * 0.66,
                    ),
                    ButtonStyleWidget2(
                      width: MediaQuery.of(context).size.width * 0.4,
                      onPress: () {
                        controller.addCategory(CategoryController.text);
                      },
                      buttonLabel: "Add Category ",
                    ),
                    controller.CategoryList.length != 0
                        ? Column(
                            children: [
                              Center(
                                  child: Text(
                                'View All Categories',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )),
                              DataTable(
                                columnSpacing: 10,
                                columns: [
                                  DataColumn(
                                      label: Text('S.NO',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('C_NAME',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('STATUS',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Action',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                ],
                                rows: List.generate(
                                    controller.CategoryList.length, (index) {
                                  return DataRow(cells: [
                                    DataCell(Text((index + 1)
                                        .toString())), // Assuming index + 1 for S.NO
                                    DataCell(Text(controller.CategoryList[index]
                                        ["name"])),
                                    DataCell(Row(
                                      children: [
                                        controller.CategoryList[index]
                                                    ["status"] ==
                                                true
                                            ? GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .updateCategoryStatus(
                                                          index, true, "");
                                                },
                                                child: Icon(Icons.check_box))
                                            : GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .updateCategoryStatus(
                                                          index, true, "");
                                                },
                                                child: Icon(Icons
                                                    .check_box_outline_blank_rounded)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(controller.CategoryList[index]
                                                ["status"]
                                            .toString()),
                                      ],
                                    )),
                                    DataCell(Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              controller.deleteCategory(index);
                                            },
                                            child: Icon(Icons.delete)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedindex = index;
                                                edittext.text = controller
                                                    .CategoryList[index]["name"]
                                                    .toString();
                                              });
                                              showDialog(
                                                  context: context,
                                                  builder: (_) => AlertDialog(
                                                        title: TextField(
                                                          controller: edittext,
                                                        ),
                                                        actions: [
                                                          ButtonStyleWidget2(
                                                              buttonLabel:
                                                                  "Cancel",
                                                              onPress: () {
                                                                Navigator.pop(
                                                                    context);
                                                              }),
                                                          ButtonStyleWidget2(
                                                              buttonLabel:
                                                                  "Update",
                                                              onPress: () {
                                                                controller
                                                                    .updateCategoryStatus(
                                                                        index,
                                                                        false,
                                                                         edittext.text);
                                                                             Navigator.pop(
                                                                    context);
                                                              })
                                                        ],
                                                      ));
                                            },
                                            child: Icon(Icons.edit)),
                                      ],
                                    )),
                                  ]);
                                }),
                              )
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
