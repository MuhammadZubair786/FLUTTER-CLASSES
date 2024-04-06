

void main() {
//   var List =["baber","asad","ali","ali","omer","saqib"];
//   List.fillRange(1, 5,"smit"); //4 =>2,2
//   print(List);
// // ["baber","smit","smit","smit","smit","saqib"];
//   // insert
//   List.replaceRange(1, 1,["NEW smit"]);
//   // "NEW smit"
//   // ["baber","NEW smit","smit","smit","smit","saqib"];
//   print(List);
// .add
// List[1]="asad"
  // List num = [1, 2, 3, 4];
  // var res = num.fold(1, (previousValue, element) => element * previousValue);
  // print(res);

  // List num1 =[1,2,3,4,5];
  // var res = num1.take(2).toList();
  // print(res);

  // List num1 =[1,2,3,4,5];
  // var res = num1.skip(2);
  // print(res);

  // List num1 =[1,2,3,4];
  // num1.shuffle();
  // print(num1);

  // List num =[1,2,3,45];
  // // var res = num.remove(30);
  // var res = num.removeAt(0);
  // print(res);
  // print(num);

  var num =[1,2,3,4,5];
  num.removeWhere((element) => element<3);
  print(num);

}
