// wrapper.dart
// Created by Casey Nguyen
// Special thanks to FlutterTemplates
// VERSION CONTROL:
// 8.17.2023 - Created bottom navigation buttons (no functionality).
// 8.18.2023 - Updated the bottom navigation buttons.
// 8.21.2023 - Added the menu options.

import 'package:budge/views/buttons.dart';
import 'package:budge/views/top_buttons.dart';
import 'package:budge/views/visualizer.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget{
  const Wrapper({Key? key}) : super(key: key);
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper>{
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"),
        leading: const TopButton(),
        centerTitle: true,
      ),
      body: const DataVisualizer(),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: TransactionButton(),
      )
    );
  }
}
