// income_dao.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.18.2023 - DAO created.
// 8.21.2023 - Changed DAO to 'Transaction'.

// When adding new DAO functions, you MUST run the following command in the
// console to update properly:
// - 'flutter packages pub run build_runner build'


import 'package:floor/floor.dart';
import '../entities/transaction.dart';

@dao
abstract class IncomeDao{
  // Retrieve ALL transactions from the DB.
  @Query('SELECT * FROM Income')
  Future<List<Income>> findAllTransactions();

  // Get the last known ID.
  @Query('SELECT IFNULL(MAX(id), 0) FROM Income')
  Future<int?> retrieveLastID();

  // Remove all incomes.
  // OUT: Resets the database, but doesn't drop the table.
  @Query('DELETE FROM Income')
  Future<void> deleteIncomes();

  // Insert an income into the DB.
  @insert
  Future<void> insertIncome(Income income);
}