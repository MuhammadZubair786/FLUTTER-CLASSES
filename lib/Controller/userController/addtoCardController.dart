import 'dart:convert';

import 'package:ecom_app/helper/global.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddToCardController extends GetxController {
  var userCard = [];

  userAddToCard(data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    data["quantity"]= 1;
    userCard.add(data);
    CardList.add(data);
    update();
  }

  getData(){
    userCard = CardList;
    update(); 
  }

  updateCard(index,status){
    if(status=="inc"){
    userCard[index]["quantity"]+=1; 
    }
    else if( userCard[index]["quantity"]!=1){
    userCard[index]["quantity"]-=1; 

    }
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
