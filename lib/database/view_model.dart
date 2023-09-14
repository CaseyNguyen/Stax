// view_model.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.18.2023 - Viewmodel created with "Add" and "List" functionality.
// 8.21.2023 - Autoincrement ID, and added delete all records functionality.
// 8.22.2023 - Balance now displays the proper information in a list, feeding
// the visualizer lots of cool data.

import 'package:flutter/cupertino.dart';
import '../entities/money.dart';
import 'database.dart';
import 'dart:math';
import 'package:flutter/widgets.dart';

class ViewModel extends ChangeNotifier{
  final BudgeDatabase _db;
  ViewModel(this._db);

  Future<List<Money>> get incomes async{
    return(await _db.moneyDao.findAllTransactions());
  }

  // balance sends the visualizer information.
  // Index 0 - Sum of incomes; Index 1 - Sum of expenses; 2 - Ready cash;
  // 3 - Utilization %, 4 - Utilization % for visual, 5 - Expense / Income
  Future<List<double>> get balance async{
    List<Money> transactionList = await _db.moneyDao.findAllTransactions();
    double incomeTotal = 0.0;
    double expenseTotal = 0.0;
    for (int i = 0; i < transactionList.length; i++){
      if (transactionList[i].type == 0) {
        incomeTotal += transactionList[i].value;
      }
      else {
        expenseTotal += transactionList[i].value;
      }
    }
    double balance = incomeTotal - expenseTotal;
    double percentage = 1.0;
    if (expenseTotal != 0){
      percentage = balance / incomeTotal;
    }
    double visualPercentage = percentage;
    if (visualPercentage < 0.0){
      visualPercentage = 0.0;
    }
    else if (visualPercentage > 1.0){
      visualPercentage = 1.0;
    }
    double expenseDivIncome = expenseTotal / incomeTotal;
    expenseDivIncome *= 100;
    return [incomeTotal, expenseTotal, balance, percentage *= 100, visualPercentage, expenseDivIncome];
  }

  // addIncome
  // IN: A short description of the transaction and a value.
  // OUT: Adds the income to the data table.
  void addIncome(int type, String name, double value) async {
    var rng = Random();
    int id = rng.nextInt(900000) + 100000;
    notifyListeners();
    Money addIncome = Money(id, type, name, "Tag", value);
    await _db.moneyDao.insertIncome(addIncome);
    notifyListeners();
  }

  void drop() async{
    _db.moneyDao.drop();
    notifyListeners();
  }

  // deleteIncome
  void deleteIncome() async{
    await _db.moneyDao.deleteIncomes();
    notifyListeners();
  }
}