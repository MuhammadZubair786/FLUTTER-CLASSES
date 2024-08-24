// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:ecom_app/Controller/userController/homecontroller.dart';
import 'package:ecom_app/View/User/Dishes/dish.dart';
import 'package:ecom_app/View/User/Home/drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_marquee/text_marquee.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  var homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCategory();
   
    });
  }

  getCategory() async {
    await homeController.getCategoryList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: DrawerData(),
        ),
        
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Text("dashboard"),
          // ,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.amber,
                  height: 100,
                  child: Center(child: Text("Slider")),
                ),
                SizedBox(height: 10,),
                
                Container(
                  color: Colors.amber,
                  child: TextMarquee(
                    '"Welcome in My Ecom App for View or Order ',
                    spaceSize: 72,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24
                    ),
                  ),
                ),
                SizedBox(height: 10,),
          
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: homeController.CategoryList.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(ViewSpeficesDish(dishData:  homeController.CategoryList[index],));
                      },
                      child: new Card(
                        color: Colors.greenAccent,
                        elevation: 10,
                        child: new GridTile(
                        header: Container(
                          height: 200,
                          child: Center(
                                child: new Text(
                                    homeController.CategoryList[index]['name'],
                                    style: TextStyle(color: Color.fromARGB(255, 243, 238, 243),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                    ),
                                    )),
                        ),
                          child: new Image.network(
                              "https://t3.ftcdn.net/jpg/02/94/19/98/360_F_294199808_iVKkhLOnlSyGFnBXf15sFx9LEW6gF9en.jpg",
                              height: 400,
                              fit: BoxFit.cover,
                              ), //just for testing, will fill with image later
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
