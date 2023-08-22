// database.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.18.2023 - Database created.

// Run 'flutter packages pub run build_runner build' in console first.

import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../dao/transaction_dao.dart';
import '../entities/transaction.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Transaction])
abstract class BudgeDatabase extends FloorDatabase {
  TransactionDao get transactionDao;
}