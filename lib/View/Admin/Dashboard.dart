// ignore_for_file: prefer_const_constructors

import 'package:ecom_app/View/Admin/DrawerData.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to admin Dashboard"),
      ),
      drawer: Drawer(
        child: DrawerData(),
      ),

    );
  }
}