// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../Widget/Messsage.dart';

class AdminCategoryController extends GetxController {
  var isLoading = true;
  var CategoryList = [];
  CollectionReference categoryInst =
      FirebaseFirestore.instance.collection("Category");

  getCategoryList() async {
    CategoryList.clear();

    await categoryInst.get().then((QuerySnapshot data) {
      data.docs.forEach((element) {
        CategoryList.add(element.data());
      });
    });
    log(CategoryList.toString());
    update();
  }

  updateCategoryStatus(index, status, name) async {
    if (status == true) {
      await categoryInst
          .doc(CategoryList[index]["catkey"])
          .update({"status": !CategoryList[index]["status"]});
            CategoryList[index]["status"] = !CategoryList[index]["status"];
    } else {
      print(name.toString());
      await categoryInst
          .doc(CategoryList[index]["catkey"])
          .update({"name": name});

          getCategoryList();
    }

  
    update();
  }

  deleteCategory(index) async {
    print(CategoryList[index]["catkey"]);
    await categoryInst.doc(CategoryList[index]["catkey"]).delete();
    CategoryList.removeAt(index);
    update();
  }

  addCategory(String name) async {
    if (name.isEmpty) {
      ErrorMessage("error", "Please Enter Category Name");
    } else {
      var key = FirebaseDatabase.instance.ref('category').push().key;

      var categoryOb = {"name": name, "status": true, "catkey": key};

      await categoryInst.doc(key).set(categoryOb);
      ErrorMessage("Success", "Add New Category");
      getCategoryList();
    }
  }
}
