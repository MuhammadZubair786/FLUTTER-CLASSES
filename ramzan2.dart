import 'dart:io';

void main() {
  // int a = int.parse(stdin.readLineSync()!.trim());
  // int b = int.parse(stdin.readLineSync()!);
  // int c = int.parse(stdin.readLineSync()!);
  // if (a > b && a > c) {
  //   print("a is greater");
  //   if (b > c) {
  //     print("b is  medium");
  //     print("c is small");
  //   } else if (c > b) {
  //     print("c is medium");
  //     print("b is small");
  //   } else {
  //     print(" c and b is equal");
  //   }
  // } else if (b > a && b > c) {
  //   print("B is greater");
  //  if (a > c) {
  //     print("a is medium");
  //     print("c is small");
  //   } else if (c > a) {
  //     print("c is medium");
  //     print("a is small");
  //   } else {
  //     print("c aND A IS EQUAl");
  //   }
  // } else if (c > a && c > b) {
  //   print("C is greater");
  //   if (b > a) {
  //     print("b is medium");
  //     print("a is small");
  //   } else if (a > b) {
  //     print("a is medium");
  //     print("b is small");
  //   } else {
  //     print("b and a is equal");
  //   }
  // } else if (a == b && b == c) {
  //   print("all equal");
  // } else if (a == b && c > b) {
  //   print("c is greater");
  //   print("a and b is equal and small");
  // } else if (a == b && b > c) {
  //   print("a and b is equal and greater");
  //   print("c is small");
  // } else if (b == c && b > a) {
  //   print("b and c is equal and greater");
  //   print("a is small");
  // } else if (b == c && b < a) {
  //   print("a is greater");
  //   print("b and c is equal and small");
  // } else if (a == c && b > c) {
  //   print("b is  gretaer");
  //   print("a and c is equal and small");
  // } else if (a == c && b < c) {
  //   print("a and c is equal and gretaer");
  //   print("b is  small");
  // }

  // user character  (ascii code )=> code unitat
  // a=> SMALL LETTER 97 & 121
  // B => capital letter 65 and 90
  // &=>special
  // 0=>number =>48 to 57
  // var a = "0";
  // print(a.codeUnitAt(0));

  String userName = stdin.readLineSync()!;
  if (userName.length == 0) {
    print("bhai data to enter kar ");
  }
   else if (userName.length > 1) {
    print("bhai hero mat ban 1 letter dya");
  } 
  else if (userName.length == 1) {

    if (userName.codeUnitAt(0) >= 65 && userName.codeUnitAt(0) <= 90) {
      
      print("ap na capital letter enter kiya ha ");
    } 
    else if (userName.codeUnitAt(0) >= 97 && userName.codeUnitAt(0) <= 121) {
      
      print("ap na small letter enter kiya ha ");
    }
    else if(userName.codeUnitAt(0)>= 48 && userName.codeUnitAt(0)<=57){
      
      print("ap na number  enter kiya ha ");
    
    }
    else{
      print("ap na special character  enter kiya ha ");

    }
  }
}
