// view_model.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.18.2023 - Viewmodel created with "Add" and "List" functionality.
// 8.21.2023 - Autoincrement ID, and added delete all records functionality.

import 'package:flutter/cupertino.dart';
import '../entities/transaction.dart';
import 'database.dart';
import 'dart:math';
import 'package:flutter/widgets.dart';

class ViewModel extends ChangeNotifier{
  final BudgeDatabase _db;
  ViewModel(this._db);

  Future<List<Income>> get incomes async{
    return(await _db.incomeDao.findAllTransactions());
  }

  Future<double> get totalIncome async{
    final list = await _db.incomeDao.findAllTransactions();
    double totalVal = 0;
    for (int i = 0; i < list.length; i++){
      totalVal += list[i].value;
    }
    return totalVal;
  }

  // addIncome
  // IN: A short description of the transaction and a value.
  // OUT: Adds the income to the data table.
  void addIncome(int type, String name, double value) async {
    var rng = Random();
    int id = rng.nextInt(900000) + 100000;
    notifyListeners();
    Income addIncome = Income(id, type, name, value);
    await _db.incomeDao.insertIncome(addIncome);
    notifyListeners();
  }

  // deleteIncome
  void deleteIncome() async{
    await _db.incomeDao.deleteIncomes();
    notifyListeners();
  }
}