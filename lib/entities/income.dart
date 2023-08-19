// income.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.17.2023 - Created Income class outline.
// 8.18.2023 - Switched to using Floor implementation.

import 'package:floor/floor.dart';

@entity
class Income{
  @primaryKey
  final int id;
  final String name;
  final double value;

  Income(this.id, this.name, this.value);
}