// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:ecom_app/View/Admin/DrawerData.dart';
import 'package:ecom_app/Widget/ButtonStyle.dart';
import 'package:ecom_app/Widget/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import '../../../Controller/Admin/AdminDishController.dart';

class AdminDishPage extends StatefulWidget {
  const AdminDishPage({super.key});

  @override
  State<AdminDishPage> createState() => _AdminDishPageState();
}

class _AdminDishPageState extends State<AdminDishPage> {
  var DishController = Get.put(AdminDishController());

  @override
  void initState() {
    super.initState();
    getCategory();
  }

  getCategory() async {
    await DishController.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dish page"),
      ),
      drawer: Drawer(
        child: DrawerData(),
      ),
      body: GetBuilder<AdminDishController>(builder: (controller) {
        return controller.isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 200,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ButtonStyleWidget2(
                                      onPress: () {},
                                      buttonLabel: "Select Picture from Camera",
                                    ),
                                    ButtonStyleWidget2(
                                      onPress: () {},
                                      buttonLabel:
                                          "Select Picture from Gallery",
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          "https://static.vecteezy.com/system/resources/previews/007/567/154/original/select-image-icon-vector.jpg"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: DishController.dropdownvalue == ""
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Select Category"),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    DishController.dropdownvalue.toString()),
                              ),
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: DishController.allDish.map((items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items["name"]),
                          );
                        }).toList(),

                        onChanged: (newValue) {
                            DishController.setDropdownValue(newValue);

                        },
                      ),
                    ),
                  ),
                  Center(
                    child: TextFieldWidget(
                        width: MediaQuery.of(context).size.width * 0.8,
                        controller: TextEditingController()),
                  ),
                  ButtonStyleWidget2(
                    onPress: () {},
                    buttonLabel: "Add Dish",
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    color: Colors.transparent,
                    height: 70,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: DishController.allDish.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 20,
                            child: ButtonStyleWidget2(
                              textStyle: TextStyle(
                                  color: const Color.fromARGB(255, 16, 17, 18),
                                  fontSize: 26),
                              width: MediaQuery.of(context).size.width * 0.5,
                              onPress: () {},
                              buttonLabel: DishController.allDish[index]["name"]
                                  .toString()
                                  .toUpperCase(),
                            ),
                          );
                        }),
                  )
                ],
              );
      }),
    );
  }
}
