// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AdminDishController extends GetxController {
  var isLoading = false;
  CollectionReference categoryInst =
      FirebaseFirestore.instance.collection("Category");
      var dropdownvalue = "";
      var selectedDropdownKey = "";

      var allDish =[];
  setLoading(val) {
    isLoading = val;
    update();
  }

  setDropdownValue(val){
    dropdownvalue = val["name"];
    selectedDropdownKey= val["catkey"];
    update();

  }

  getCategory() async {
    setLoading(true);
    await categoryInst.where("status",isEqualTo: true).get().then((QuerySnapshot data) {
      final allData = data.docs.map((doc) => doc.data()).toList();
      print(allData);

      
      allDish= allData;
    
    });
    setLoading(false);
    update();

  }
}
