import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("dashboard"),
        ),
        body: Text("Welcome in app"),
      ),
    );
  }
}