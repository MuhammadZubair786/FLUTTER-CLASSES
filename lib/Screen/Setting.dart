// ignore_for_file: prefer_const_constructors

import 'package:class5/Screen/drawer.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: DrawerData(),
      ),
      body: Center(
        child: Text("Setting Us"),
      ),
    );
  }
}