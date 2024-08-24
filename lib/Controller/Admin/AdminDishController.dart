// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print, unnecessary_brace_in_string_interps

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_app/Widget/Messsage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminDishController extends GetxController {
  var isLoading = false;
  CollectionReference categoryInst =
      FirebaseFirestore.instance.collection("Category");

  CollectionReference DishInst =
      FirebaseFirestore.instance.collection("Dishes");
  var dropdownvalue = "";
  var selectedDropdownKey = "";
  var filepath = "";
  var dishName = TextEditingController();
  var dishPrice = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  var image;

  var allDish = [];
  var SelectDish = [];
  setLoading(val) {
    isLoading = val;
    update();
  }

  setDropdownValue(val) {
    dropdownvalue = val["name"];
    selectedDropdownKey = val["catkey"];
    update();
  }

  setImage(source) async {
    final XFile? file = await _picker.pickImage(source: source);
    if (file != null) {
      // print(file.path);
      image = File(file.path);
      filepath = file.path;
    }
    update();
  }

  addDish() async {
    if (image == null) {
      ErrorMessage("error", "Please Select Dish Image");
    } else if (selectedDropdownKey == "") {
      ErrorMessage("error", "Please Enter Category");
    } else if (dishName.text.isEmpty) {
      ErrorMessage("error", "Please Enter DishName");
    } else if (dishPrice.text.isEmpty) {
      ErrorMessage("error", "Please Enter DishPrice");
    } else if (dropdownvalue == "All") {
      ErrorMessage("error", "Not add in this category");
    } else {
      var filename = filepath.toString().split("/").last;

      final storageRef = FirebaseStorage.instance.ref();
      final imagesRef = storageRef.child("dish/${filename}");
      await imagesRef.putFile(image);
      var downloadUrl = await imagesRef.getDownloadURL();
      // print(downloadUrl);

      var key = FirebaseDatabase.instance.ref('Dish').push().key;

      var obj = {
        "DishName": dishName.text,
        "CategoryName": dropdownvalue,
        "CategoryKey": selectedDropdownKey,
        "DishPrice": dishPrice.text,
        "DishKey": key,
        "DishImage": downloadUrl
      };

      // print(obj);


      await DishInst.doc(key).set(obj);
      ErrorMessage("Success", "Add New Dish");
    }
  }

  getDish(index) async {
    // print(allDish[index]);
    for(var i=0;i<allDish.length;i++){
       allDish[i]["selected"]=false;
    }
    allDish[index]["selected"]=true;
    update();
    if (allDish[index]["catkey"] == "") {
      await DishInst.get().then((QuerySnapshot data) {
        final allDishData = data.docs.map((doc) => doc.data()).toList();
        SelectDish = allDishData;
        update();
      });
    } else {
      await DishInst.where("CategoryKey", isEqualTo: allDish[index]["catkey"])
          .get()
          .then((QuerySnapshot data) {
        final allDishData = data.docs.map((doc) => doc.data()).toList();
        SelectDish = allDishData;
        update();
      });
    }
  }

  deleteDish(index) async {
    await DishInst.doc(SelectDish[index]["DishKey"]).delete();
    SelectDish.removeAt(index);
    update();

  }

  getCategory() async {
     var newList =[];
     allDish=[];
    setLoading(true);
    await categoryInst
        .where("status", isEqualTo: true)
        .get()
        .then((QuerySnapshot data) {  
      final allData = data.docs.map((doc) => doc.data()).toList();
      // print(allData);
     
      for(var i=0;i<allData.length;i++){
        var newdata = allData[i] as Map ;
        newdata["selected"]=false;
        newList.add(newdata);
      }
    
      var newdata = {"catkey": "", "name": "All", "status": true,"selected":true};

      allDish.addAll(newList);

      allDish.insert(0, newdata);
      print(allDish);
      update();
      getDish(0);
    });
    setLoading(false);
    update();
  }
}
