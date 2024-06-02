import 'package:flutter/material.dart';
import 'package:testapp/Screens/GridViewList.dart';
import 'package:testapp/Screens/auth.dart';
import 'package:testapp/Screens/new.dart';

class ShowaLLsCREENS extends StatefulWidget {
  const ShowaLLsCREENS({super.key});

  @override
  State<ShowaLLsCREENS> createState() => _ShowaLLsCREENSState();
}

class _ShowaLLsCREENSState extends State<ShowaLLsCREENS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Text("Sign Up Page Open")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Uicompoennets()));
                },
                child: Text("ListView Page Open")),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GridVieWLiST()));
            }, child: Text("GridView Page Open")),
          ],
        ),
      ),
    );
  }
}
