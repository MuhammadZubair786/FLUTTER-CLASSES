// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool showPassword = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

 GlobalKey<FormState> formState = GlobalKey<FormState>();
  var regpassword = RegExp('^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%&\*])(?=.{8,})');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SafeArea(
        child: Form(
          key: formState,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value){

                    RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

                    if(value!.isEmpty){
                      return "Required";

                    }
                    else if (!emailRegex.hasMatch(value)){
                       return "enter valid email";
                    }
                    return null;


                  },
                  controller: email,
                  
                  
                  keyboardType:TextInputType.emailAddress,
                    decoration: InputDecoration(
                      
                        fillColor: const Color.fromARGB(255, 238, 235, 235),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.email,
                          size: 30,
                          color: const Color.fromARGB(255, 54, 70, 244),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 10,
                              color: Colors.red,
                              style: BorderStyle.solid),
                        ),
                        // errorBorder: ,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 5,
                              color: const Color.fromARGB(255, 54, 244, 222),
                              style: BorderStyle.solid),
                        ),
                        hintText: "Enter Your Email",
                        hintStyle: TextStyle(
                          color: Colors.red,
                          // fontSize: 30
                        ))),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: password,
                  validator: (name){
                   
                    if(name!.isEmpty){
                      return "Required";

                    }
                    else if(name.length<8){
                      return "Bhai 8 letter do";

                    }
                    else if(!name.toString().substring(0,2).startsWith("03")){
                      return "bhaio number sei dya ";

                    }
                    else if(!regpassword.hasMatch(name)){
                      return "False data";


                    }
                    return null;

                  },
                 
                    obscureText: showPassword,
                    decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 238, 235, 235),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 30,
                          color: const Color.fromARGB(255, 54, 70, 244),
                        ),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              showPassword = !showPassword;
                              setState(() {});
                            },
                            child: Icon(Icons.remove_red_eye)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 10,
                              color: Colors.red,
                              style: BorderStyle.solid),
                        ),
                        // errorBorder: ,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 5,
                              color: const Color.fromARGB(255, 54, 244, 222),
                              style: BorderStyle.solid),
                        ),
                        hintText: "Enter Your Password",
                        hintStyle: TextStyle(
                          color: Colors.red,
                          // fontSize: 30
                        ))),
              ),
              ElevatedButton(
                onPressed: (){
                  
                  if(formState.currentState!.validate()){
                   

                  }
                  else{
                  print("your email is : ${email}");
                  print(password.text);

                  }
             
        
              }, child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
