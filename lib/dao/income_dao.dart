// income_dao.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.18.2023 - DAO created.

// When adding new DAO functions, you MUST run the following command in the
// console to update properly:
// - 'flutter packages pub run build_runner build'


import 'package:floor/floor.dart';
import '../entities/income.dart';

@dao
abstract class IncomeDao{
  // Retrieve ALL incomes from the DB.
  @Query('SELECT * FROM Income')
  Future<List<Income>> findAllIncomes();

  // Insert an income into the DB.
  @insert
  Future<void> insertIncome(Income income);
}