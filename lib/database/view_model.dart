// view_model.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.18.2023 - Viewmodel created with "Add" and "List" functionality.
// 8.21.2023 - Autoincrement ID, and added delete all records functionality.
// 8.22.2023 - Balance now displays the proper information in a list, feeding
// the visualizer lots of cool data.

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

  // balance sends the visualizer information.
  // Index 0 - Sum of incomes; Index 1 - Sum of expenses; 2 - Utilization %;
  // 3 - Utilization % in visual.
  Future<List<double>> get balance async{
    // Need to fix this.
    List<double> a = [0];
    double b = 0;
    for (int i = 0; i < a.length; i++){
      b += a[i];
    }
    double totIncome = 50.0;
    double totExpense = 100.0;
    double utilization = (totIncome - totExpense) / totIncome;
    double utilizationView = utilization;
    if (utilizationView < 0) {
      utilizationView = 0;
    } else if (utilizationView > 1) {
      utilizationView = 1;
    }
    return [totIncome, totExpense, utilization * 100, utilizationView, b];
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

  void drop() async{
    _db.incomeDao.drop();
    notifyListeners();
  }

  // deleteIncome
  void deleteIncome() async{
    await _db.incomeDao.deleteIncomes();
    notifyListeners();
  }
}