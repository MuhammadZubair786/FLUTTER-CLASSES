// ignore_for_file: unnecessary_new, prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_is_empty

import 'package:ecom_app/Controller/userController/homecontroller.dart';
import 'package:ecom_app/View/User/Dishes/NewDish.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ViewSpeficesDish extends StatefulWidget {
  var dishData;
  ViewSpeficesDish({super.key, required this.dishData});

  @override
  State<ViewSpeficesDish> createState() => _ViewSpeficesDishState();
}

class _ViewSpeficesDishState extends State<ViewSpeficesDish> {
  var homeController = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getDish();
    });
  }

  getDish() async {
    homeController.setData();
    await homeController.getDishByIdCategory(widget.dishData["catkey"]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.dishData["name"]),
            ),
            body: GetBuilder<HomeController>(builder: (controller) {
              return homeController.dishLoding
                  ? CircularProgressIndicator()
                  : homeController.SelectDish.length == 0
                      ? Center(child: Text("No dish in this Category"))
                      : GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: homeController.SelectDish.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.greenAccent,
                              elevation: 10,
                              child: new GridTile(
                                  header: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          new Image.network(
                                            homeController.SelectDish[index]
                                                ["DishImage"],
                                            height: 100,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            fit: BoxFit.cover,
                                          ),
                                          Container(
                                            height: 200,
                                            child: Column(
                                              children: [
                                                new Text(
                                                  homeController
                                                          .SelectDish[index]
                                                      ['DishName'].length> 14  ? homeController
                                                          .SelectDish[index]
                                                      ['DishName'].toString().substring(0,14) :homeController
                                                          .SelectDish[index]
                                                      ['DishName'] ,
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 243, 238, 243),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                new Text(
                                                  "\$" +
                                                      homeController
                                                              .SelectDish[index]
                                                          ['DishPrice'],
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 243, 238, 243),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                          right: 0,

                                          top: 0,
                                          child:  GestureDetector(
                                        onTap: (){
                                          showBottomSheet(context: context, builder: (context){
                                            return Container(
                                              height: 300,
                                              width: MediaQuery.of(context).size.width,
                                              child: ViewDishPage(dishData: homeController.SelectDish[index],));
                                          });
                                        },
                                            child: CircleAvatar(
                                                backgroundColor: Colors.amber,
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                )),
                                          ))
                                    ],
                                  ),
                                  child:
                                      Container() //just for testing, will fill with image later
                                  ),
                            );
                          });
            })));
  }
}
