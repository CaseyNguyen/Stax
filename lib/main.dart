// main.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.17.2023 - Created the application. Assigned to Wrapper.


import 'package:budge/database/view_model.dart';
import 'package:budge/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(database: await $FloorBudgeDatabase.databaseBuilder("transaction.db").build()));
}

class MyApp extends StatelessWidget {
  final BudgeDatabase database;
  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModel(database),
      child: MaterialApp(
        title: 'Stax',
        theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        fontFamily: 'Georgia'
        ),
          home: const Wrapper()
      )
    );
  }
}