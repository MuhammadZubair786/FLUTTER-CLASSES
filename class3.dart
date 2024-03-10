import 'dart:io';

void main() {
  // double a = 23.567; //double
  // int b = 45;
  // double d = a + b;
  // print(d);
  // var data = a.toString().split(".");
  // int res = int.parse(data[0]) + b;
  // print(res);

  // 13000.567
  // bool classStatus = true;
  // double a = 12.56;
  // double b = 4;
  // // varb = b.toString().split(".")
  // int c = a.toInt() + b.toInt();
  // int d = a-b;
  // int e = a*b;
  // double f = a / b;
  // int g = a ~/ b;

  // %

  // Atm => 16635
  // 10000
  // 5000=>3
  // 1000 =>1
  // 500=>1
  // 100=>1
  // 50=0
  // 20=>1
  // 10=1

  // int a = int.parse(stdin.readLineSync()!);
  // int fiveTh= a~/5000; //~/ note
  // print('Five thousand note :$fiveTh');
  // int leftamount = a%5000; //left amount
  // // print(leftamount);
  // int thousanNote = leftamount~/1000;
  // print(thousanNote);
  // int leftnewAmount = leftamount%1000;
  // // print(leftnewAmount);
  // int hunbrednote = leftnewAmount~/100;
  // print(hunbrednote);
  // int lefthund = leftnewAmount%100;
  // // print(lefthund);
  // int tennote = lefthund~/10;
  // print(tennote);
  // int a = 5;
  // int b = 5;
  // bool c = a <= b; 
  // print(c);
  // stdout.write("Enter First Number");
  // int a =int.parse(stdin.readLineSync()!) ;
  // stdout.write("Enter Second Number");
  // int b = int.parse(stdin.readLineSync()!);
  // bool res1 = a>b;
  // print('Result of first is : ${res1}');
  // bool res2 = a==b;
  // print('Result of second is : ${res2}');
  // bool res3 = a<b;
  // print('Result of second is : ${res3}');

  // var a = "Test";
  // var b = "t";
  // var res = a!=b;
  // print()
  // String a = "A";
  // String b = "a";
  // print(a==b);
stdout.write("enter first number");
  int a= int.parse(stdin.readLineSync()!);
  stdout.write("enter first number");
  int b =int.parse(stdin.readLineSync()!);
  stdout.write("enter first number");
  int c=int.parse(stdin.readLineSync()!);
  bool res = a>b && a>c ; //false
  bool res1 = b>a && b>c ; 
  bool res2 = c>a && c>b ; 
  bool res3 = c==b && b==a;
  print(res);
  print(res1);
  print(res2);
   print(res3);









  // print(c);
  // print(d);
  // print(e);
  // print(f);
  // print(g);

  // print(int.parse(a.toString().replaceAll(".", replace)));
}
