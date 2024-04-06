

import 'dart:io';

void main() {
  // stdout.writeln("Enter number");
  // int a = int.parse(stdin.readLineSync()!);
  // if(a%2==0){
  //   print("${a} is Even Number");
  // }
  // else{
  //   print("${a} is odd Number");
  // }

  // stdout.write("Enter Your Name");
  // String name = stdin.readLineSync()!;

  // stdout.write("eNTER YOUR AGE");
  // int age = int.parse(stdin.readLineSync()!);

  // final stopwatch = Stopwatch()..start();

  // if (name[0].toLowerCase() == "a" ||
  //     name[0].toLowerCase() == "e" ||
  //     name[0].toLowerCase() == "i" ||
  //     name[0].toLowerCase() == "o" ||
  //     name.toLowerCase() == "u") {
  //       if(age>=18){
  //         print("You eligible for Flutter course");

  //       }
  //       else{
  //         print("your age is not more then or equal to 18");
  //       }
    
  // }
  // else{
  //   print("ap ka name ma koi vowel nhi ha ");
  // }

  // print(stopwatch.elapsed);

  // km 
  // 1=>km =>10
  // hyderabad=>140km=>140*10=>1400
  // nooribad=>70km=>70*10=>700
  // String a = "50";
  // int a =10;

  // int day =4;
  // switch(day){
  //   case 0 :
  //   print("Today is Sunday");
  //   case 1 :
  //   print("Today is Monday");   
  //    case 2 :
  //   print("Today is Tuesday");   
  //    case 4 :
  //   print("Today is wednesday"); 
  //   case 4 :
  //   print("Today is thursday");    

  //   case 5 :
  //   print("Today is friday");    
  //   case 4 :
  //   print("Today is saturday");
  //   default:
  //   print("encorrect value");
  // }

  // switch(a){
  //   case 0 :
  //   print("value is 0");
  //   case 1:
  //   print("value is 1");
  //   case 2:
  //   print("value is 2");
  //   case 5:
  //   print("value is 5");
  //   default:
  //   print("new value ");

  // }

  // String a = "+";
  // int num1 =4;
  // int num2 = 5;

  // switch(a){
  //   case "+":
  //   print(num1+num2);
  //   print("add");
  //    case "-":
  //     print(num1-num2);
  //   print("sub");
  //   default:
  //   print("encorrect value");

  // }
  // List<int> a =[1,2,3,4,5,];
  // List age =[10,20,30,"test",true,3.45];
  // print(age);
  // print(age.runtimeType);
  // List<String> name =["asad","ali"];
  // List<int> age =[10,20,30,40,50,60];
  // List<bool> status = [true,false];
  // List<double> numb =[32.56,45,56.78];
// Number
  // List data =[12,"smit",true,34.78]; 
  // var data2 =[12,34,67.89,"new data"];

  // List username = ["asad","ali","umer","saqib","new"];
  // print(username[4]); //store 0

  // add method
//   username.add(56);
//   print(username);

//   username.addAll([2,3,"test",true]);
//   print(username);

//   print(username.first);
//   print(username.last);

// // insert(index,data)
//   // username.insert(2, "new data");
//   // print(username);

//   username.replaceRange(1, 3, ["smit hyderabad"]);
//   print(username);


//   print(username.elementAt(4));
//   print(username[4]);

//   print(username.contains("computer"));

  // var userData = ["asad","ali","umer"];
  // stdout.write("enter index where you add new data");
  // int index = int.parse(stdin.readLineSync()!);
  // stdout.write("enter value new data");
  // String value = stdin.readLineSync()!;
  // if(index<userData.length){
  // userData.insert(index, value);
  // print(userData);
  // }
  // else{
  //   print("bhai ham na error handle kiya hua ha ");
  //   userData.add(value);
  //    print(userData);

  // }
  var data =[20,34,56,78,1,46,18,12];
  // data.sort();
  // print(data.reversed.toList());


  // var name = ["baber","shoail","kamran","Ali","asad","saad"];
  // // name.add("saqib");
  // //   // name.add("saqeeb");
  // name.sort();
  //  print(name.reversed); //return nothing
  // print(name);



  // var data1 =[10000,20000,30000,50000,200000];
  // var check = data1.every((value) => value>=200000);
  // print(check);

  // cricket 
  // var newdata = [1,2,3,4,5,6,];
  // newdata.clear(); ///cashe 
  // print(newdata);

  var arr = ["asad","ali","baber"];
  var check = arr.any((element) => element.startsWith("a") || element.startsWith("b"));
  print(arr);
  print(check);

  // var arr =[]
  // var newlist =["a","s","a","d"];
  // var stdata = newlist.join(""); //join =>arr to string
  // print(newlist);
  // print(stdata.toString().substring(0,2));

  // var centerName  ="Smait hyderabad"; 
  // var list = centerName.split(" "); //string to array 
  // print(list);

  var userName = [];
  stdout.write("Enter Data from add in list");
  String inp1 = stdin.readLineSync()!;
  userName.add(inp1);

  stdout.write("Enter Data from add in list");
  String inp2 = stdin.readLineSync()!;
  userName.add(inp2);


  stdout.write("Enter Data from add in list");
  String inp3 = stdin.readLineSync()!;
  userName.add(inp3);

  stdout.write("enter value for serach in list");
  String searchInput = stdin.readLineSync()!;

  bool checkUser = userName.contains(searchInput);

  if(checkUser){
    print("this element present in list");
  }
  else{
    print("not present in list");
  }


































  


}
