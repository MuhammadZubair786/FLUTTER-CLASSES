// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:ecomapp/Components/Auth/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  var _image;
  var filedata;
  var uid;
  var imagelink;

  final ImagePicker _picker = ImagePicker();

  var regpassword =
      RegExp('^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%&\*])(?=.{8,})');

  Future<void> RegsisterUser() async {
    print(email.text);
    print(password.text);
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);
      final user = userCredential.user;
      print(user?.uid);
      
      setState(() {
        uid= user?.uid;
      });
      // email.text = "";
      // password.text = "";
      imageStoreStorage();
     
    } catch (e) {
      print(e.toString());
    }
  }

  pickImage(source) async {
    final pickedFile = await _picker.pickImage(source: source);

    print(pickedFile!.path);
    setState(() {
      _image = File(pickedFile!.path);
      filedata = pickedFile;
    });
    // imageStoreStorage();
  }

  imageStoreStorage() async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference storageRef = storage.ref().child("staff/${filedata.path}");
      UploadTask upload = storageRef.putFile(_image);
      TaskSnapshot snapshot = await upload.whenComplete(() => ());
      String downloadUrl = await snapshot.ref.getDownloadURL();
      print(downloadUrl);
      setState(() {
      imagelink=downloadUrl;
        
      });
      storedb();
    } catch (e) {
      print(e);
    }
  }

  storedb() async {
    var dbinstance = FirebaseDatabase.instance;
    DatabaseReference dbref = dbinstance.reference();

    var userObj = {
      "email":email.text.toString(),
      "password":password.text.toString(),
      "imageUrl":imagelink,
      "name":"test",
      "age":20
    };
    
    
  await  dbref.child("user").child(uid).push().update(userObj);
     Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));

  }

  showBottomSheet() {
    showModalBottomSheet<void>(
      // context and builder are
      // required properties in this widget
      context: context,
      builder: (BuildContext context) {
        // we set up a container inside which
        // we create center column and display text

        // Returning SizedBox instead of a Container
        return SizedBox(
          height: 50,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);

                      pickImage(ImageSource.camera);
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.camera),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      pickImage(ImageSource.gallery);
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.photo),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formState,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text("User Sign up"),
              GestureDetector(
                  onTap: () {
                    showBottomSheet();
                  },
                  child: _image == null
                      ? CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                              "https://img.freepik.com/premium-vector/energy-flow-qi-chee-icon-vector-image-can-be-used-alternative-medicine_120816-199403.jpg?uid=R76992221&ga=GA1.1.1881161492.1714914526&semt=ais_user"))
                      : CircleAvatar(
                          radius: 80, backgroundImage: FileImage(_image))),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    validator: (value) {
                      RegExp emailRegex =
                          RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

                      if (value!.isEmpty) {
                        return "Required";
                      } else if (!emailRegex.hasMatch(value)) {
                        return "enter valid email";
                      }
                      return null;
                    },
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
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
                    validator: (name) {
                      if (name!.isEmpty) {
                        return "Required";
                      }
                      // else if(name.length<8){
                      //   return "Bhai 8 letter do";

                      // }
                      // else if(!name.toString().substring(0,2).startsWith("03")){
                      //   return "bhaio number sei dya ";

                      // }
                      else if (!regpassword.hasMatch(name)) {
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
                  onPressed: () {
                    // if (formState.currentState!.validate()) {
                    // } else {
                    RegsisterUser();
                    // }
                  },
                  child: Text("Submit")),
              ElevatedButton(
                  onPressed: () {
                    // if (formState.currentState!.validate()) {
                    // } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                    // }
                  },
                  child: Text("Already Account,Login ")),
            ],
          ),
        ),
      ),
    );
  }
}
