// database.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.18.2023 - Database created.

// Run 'flutter packages pub run build_runner build' in console first.

import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'operation_dao.dart';
import '../entities/money.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Money])
abstract class BudgeDatabase extends FloorDatabase {
  MoneyDao get moneyDao;
}