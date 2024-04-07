import 'dart:io';
void main(){
  Map userData = {};
  stdout.write("name");
  String name = stdin.readLineSync()!;
  
  stdout.write("age");
  int age = int.parse(stdin.readLineSync()!);
  
  if(age>0 && age <18){
    stdout.write("___COURSES___\na)Graphics \nb)CCO\nPlease choose your course : ");
    String course = stdin.readLineSync()!.toLowerCase();
    if(course == "a"){
      userData.addAll({"name" : name , "Age" : age , "course" : "Graphics"});
      print(userData);
    }else if(course == "b"){
      userData.addAll({"name" : name , "Age" : age , "course" : "CCO"});
      print(userData);
      }else{
        print("Please choose correctly");
      }
  }else if(age>=18 && age <=45){
    stdout.write("___COURSES___\na)Web & Mobile \nb)Flutter\nPlease choose your course : ");
    String course = stdin.readLineSync()!.toLowerCase();
    if(course == "a"){
      userData.addAll({"name" : name , "Age" : age , "course" : "Web & Mobile"});
      print(userData);
    }else if(course == "b"){
      userData.addAll({"name" : name , "Age" : age , "course" : "Flutter"});
      print(userData);
      }else{
        print("Please choose correctly");
      }
}else{
  print("not welcome");
}
}