import 'dart:async';
import 'dart:io';

void main() {
  // int table = int.parse(stdin.readLineSync()!);

  // int limit = int.parse(stdin.readLineSync()!);

  // for (int i = 1; i <= limit; i++) {
  //   print("${table}*${i}=${table * i}");
  // }

  // for (var i = 0; i < 10; i++) {
  //   print(i);
  // }

  // var list = [1, 2, 3, 4, 5, 70, 89, 89];
  // for (var i = 0; i < list.length; i++) {
  //   print(list[i]);
  // }

  // var name = ["asad", "ali", "saqib", "omer", "baber", "omer"];
  // var username = stdin.readLineSync()!;
  // int count = 0; //repeat
  // for (var i = 0; i < name.length; i++) {
  //   if (name[i] == username) {
  //     count++;
  //   }
    
  // }

  // if (count == 0) {
  //   print("not found");
  //   name.add(username);
  // } else {
  //   print("value found ${count> 1 ? "repeat":""} count =${count}");
  // }
  // print("list :${name}");

  

  // for (var i = 0; i < listArray.length; i++) {
  //   if (listArray[i] % 2 == 0) {
  //     print("index is : ${i} and value is ${listArray[i]}" );
  //   }
  //   else{
  //     print("not show is ${listArray[i]} and ans : ${listArray[i] % 2} ");
  //   }
  // }

  var list =[2,5,7,1,2,34,5,78,5,-4];
  var start  = list[0];
  for(var i=0;i<list.length;i++){
    if(start>list[i]){
      print(i);
      start = list[i];
      print(start);
      print("**********");

    }

  }
  print(start);

}
