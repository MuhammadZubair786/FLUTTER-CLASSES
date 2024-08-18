// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var dishLoding = true;
  var isLoading = true;
  var SelectDish= [];
  var CategoryList = [];
  CollectionReference categoryInst =
      FirebaseFirestore.instance.collection("Category");

  CollectionReference DishInst =
      FirebaseFirestore.instance.collection("Dishes");

  setData(){
    SelectDish.clear();
    update();
  }

  setdishLoading(val){
    dishLoding = val;
    update();

  }

  getCategoryList() async {
    CategoryList.clear();

    await categoryInst.where("status", isEqualTo: true).get().then((QuerySnapshot data) {
      print(data);
      data.docs.forEach((element) {
        CategoryList.add(element.data());
      });
    });
    log(CategoryList.toString());
    update();
  }

  getDishByIdCategory(key) async {
  setdishLoading(true);
    await DishInst.where("CategoryKey", isEqualTo: key)
        .get()
        .then((QuerySnapshot data) {
      final allDishData = data.docs.map((doc) => doc.data()).toList();
      SelectDish = allDishData;
      setdishLoading(false);
      update();
    });
  }
}
