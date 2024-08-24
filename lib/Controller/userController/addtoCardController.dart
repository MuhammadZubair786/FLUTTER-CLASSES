import 'dart:convert';

import 'package:ecom_app/helper/global.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddToCardController extends GetxController {
  var userCard = [];

  userAddToCard(data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userCard.add(data);
    CardList.add(data);
    update();
  }

  getData(){
    userCard = CardList;
    update(); 
  }



  // getAllCard() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var DataList = prefs.getStringList("addToCard");
  //   DataList!.map((jsonString) => jsonDecode(jsonString)).toList();
  //   print(DataList);
  //   userCard.addAll(DataList);
  // }

  checkCard(data) {
    var check = false;
    for (var i = 0; i < userCard.length; i++) {
      if (userCard[i]["DishKey"] == data["DishKey"]) {
        check = true;
        break;
      }
    }
    return check;
  }
}
