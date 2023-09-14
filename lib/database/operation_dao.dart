// operation_dao.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.18.2023 - DAO created.
// 8.21.2023 - Changed DAO to 'Transaction'.

// When adding new DAO functions, you MUST run the following command in the
// console to update properly:
// - 'flutter packages pub run build_runner build'


import 'package:floor/floor.dart';
import '../entities/money.dart';

@dao
abstract class MoneyDao{
  // Retrieve ALL transactions from the DB.
  @Query('SELECT * FROM Money')
  Future<List<Money>> findAllTransactions();

  // Retrieve all incomes from the DB.
  @Query('SELECT * FROM Money')
  Future<List<double>> sumIncome();

  @Query('DROP TABLE IF EXISTS Money')
  Future<void> drop();

  // Retrieve all expenses from the DB.
  @Query('SELECT SUM(value) FROM Money WHERE type = 1')
  Future<double?> sumExpense();

  // Get the last known ID.
  @Query('SELECT IFNULL(MAX(id), 0) FROM Money')
  Future<int?> retrieveLastID();

  // Remove all transactions.
  // OUT: Resets the database, but doesn't drop the table.
  @Query('DELETE FROM Money')
  Future<void> deleteIncomes();

  // Insert an income into the DB.
  @insert
  Future<void> insertIncome(Money value);
}