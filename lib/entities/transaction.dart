// transaction.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.17.2023 - Created Income class outline.
// 8.18.2023 - Switched to using Floor implementation.
// 8.21.2023 - Added "Type" to differentiate Income from Expense.

import 'package:floor/floor.dart';

@entity
class Income{
  @primaryKey
  final int id;
  final int type; // The type of transaction. 0 is income, 1 is expense.
  final String name;
  final double value;

  Income(this.id, this.type, this.name, this.value);
}