// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:testapp/Screens/GridViewList.dart';
import 'package:testapp/Screens/auth.dart';

class Uicompoennets extends StatefulWidget {
  const Uicompoennets({super.key});

  @override
  State<Uicompoennets> createState() => _UicompoennetsState();
}

class _UicompoennetsState extends State<Uicompoennets> {
  var user = [
    "asad",
    "ali",
  ];

  var storeImages = [
    "https://cdn.pixabay.com/photo/2020/04/17/19/48/city-5056657_640.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScFK9-Vc9hBK8n4P4z76_lig7Mek1bAeleWBTjUAcSPOz3Gm0hTL8COcrHI9vXa115Xhc&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHu55qoCgPTau60FsS8I6IBbjMWF1ixU6B5g&s",
    "https://cdn.pixabay.com/photo/2020/04/17/19/48/city-5056657_640.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScFK9-Vc9hBK8n4P4z76_lig7Mek1bAeleWBTjUAcSPOz3Gm0hTL8COcrHI9vXa115Xhc&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHu55qoCgPTau60FsS8I6IBbjMWF1ixU6B5g&s",
    "https://cdn.pixabay.com/photo/2020/04/17/19/48/city-5056657_640.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScFK9-Vc9hBK8n4P4z76_lig7Mek1bAeleWBTjUAcSPOz3Gm0hTL8COcrHI9vXa115Xhc&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHu55qoCgPTau60FsS8I6IBbjMWF1ixU6B5g&s",
    "https://cdn.pixabay.com/photo/2020/04/17/19/48/city-5056657_640.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScFK9-Vc9hBK8n4P4z76_lig7Mek1bAeleWBTjUAcSPOz3Gm0hTL8COcrHI9vXa115Xhc&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHu55qoCgPTau60FsS8I6IBbjMWF1ixU6B5g&s",
    "https://cdn.pixabay.com/photo/2020/04/17/19/48/city-5056657_640.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScFK9-Vc9hBK8n4P4z76_lig7Mek1bAeleWBTjUAcSPOz3Gm0hTL8COcrHI9vXa115Xhc&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHu55qoCgPTau60FsS8I6IBbjMWF1ixU6B5g&s",
  ];

  var chatUserList = [
    {
      "name": "smit",
      "lastmessage": "aya rei ha kuch kuch ",
      "time": "07.25",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHu55qoCgPTau60FsS8I6IBbjMWF1ixU6B5g&s"
    },
    {
      "name": "usman",
      "lastmessage": "yr react native easy tei",
      "time": "07.26",
      "dept": "hr",
      "image": ""
    },
    {"name": "ali", "lastmessage": "robot kb ready ho gya", "time": "07.50"},
    {
      "name": "ali",
      "lastmessage": "robot kb ready ho gya",
      "time": "07.50",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHu55qoCgPTau60FsS8I6IBbjMWF1ixU6B5g&s"
    },
    {
      "name": "ali",
      "lastmessage": "robot kb ready ho gya",
      "time": "07.50",
      "dept": "hr",
    },
    {"name": "ali", "lastmessage": "robot kb ready ho gya", "time": "07.50"},
    {
      "name": "ali",
      "lastmessage": "robot kb ready ho gya",
      "time": "07.50",
      "dept": "hr",
    },
    {"name": "ali", "lastmessage": "robot kb ready ho gya", "time": "07.50"},
    {"name": "ali", "lastmessage": "robot kb ready ho gya", "time": "07.50"},
    {"name": "smit", "lastmessage": "aya rei ha kuch kuch ", "time": "07.25"},
    {
      "name": "usman",
      "lastmessage": "yr react native easy tei",
      "time": "07.26"
    },
    {"name": "ali", "lastmessage": "robot kb ready ho gya", "time": "07.50"},
  ];

// var user =[
//   {
//     "name":"asad",
//     "lastmessage":"hello",
//     "time":"12.30"
//   },
//  {
//     "name":"ali",
//     "lastmessage":"hi",
//     "time":"12.30"
//   },
//   {
//     "name":"baber",
//     "lastmessage":"new user",
//     "time":"12.30"
//   }
// ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("bHAI BHT MUSHKIL"),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Text("chat user list"),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: storeImages.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Row(
                            children: [
                              Image.network(storeImages[index]),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        );
                      }),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(), //
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return chatUserList[index]["image"] != null
                          ? mymainUser(
                              chatUserList[index]["image"],
                              chatUserList[index]["name"],
                              chatUserList[index]["lastmessage"],
                              chatUserList[index]["time"],
                            )
                          : Chatuser(
                              chatUserList[index]["name"],
                              chatUserList[index]["lastmessage"],
                              chatUserList[index]["time"],
                              Colors.red,
                              chatUserList[index]["dept"]);
                    }),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GridVieWLiST()));
                    },
                    child: Text("open greidview"))
              ],
            ),
          )),
    );
  }

  mymainUser(pic, name, lastmessage, time) {
    return ListTile(
      leading:
          CircleAvatar(backgroundColor: Colors.red, child: Image.network(pic)),
      title: Text(name),
      subtitle: Text(lastmessage),
      trailing: Text(time),
    );
  }

  Chatuser(name, lastmessage, time, color, dept) {
    return Card(
      elevation: 30,
      color: dept == "hr" ? Colors.red : null,
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: color,
            child: Icon(
              Icons.person,
              color: Colors.white,
            )),
        title: Text(name),
        subtitle: Text(lastmessage),
        trailing: Text(time),
      ),
    );
  }
}
