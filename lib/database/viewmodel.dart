// viewmodel.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.18.2023 - Viewmodel created with "Add" and "List" functionality.
// 8.21.2023 - Autoincrements ID, and added delete all records functionality.

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import '../entities/transaction.dart';
import 'database.dart';
import 'dart:math';

class ViewModel extends ChangeNotifier{
  final BudgeDatabase _db;
  ViewModel(this._db);

  Future<List<Transaction>> get incomes async{
    return(await _db.transactionDao.findAllTransactions());
  }

  Future<double> get totalIncome async{
    final list = await _db.transactionDao.findAllTransactions();
    double totalVal = 0;
    for (int i = 0; i < list.length; i++){
      totalVal += list[i].value;
    }
    return totalVal;
  }

  // addIncome
  // IN: A short description of the transaction and a value.
  // OUT: Adds the income to the data table.
  void addIncome(String name, double value) async {
    var rng = Random();
    int id = rng.nextInt(900000) + 100000;
    notifyListeners();
    Transaction addIncome = Transaction(id, name, value);
    await _db.transactionDao.insertIncome(addIncome);
    notifyListeners();
  }

  // deleteIncome
  void deleteIncome() async{
    await _db.transactionDao.deleteIncomes();
    notifyListeners();
  }
}