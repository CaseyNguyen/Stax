// viewmodel.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.18.2023 - Viewmodel created with "Add" and "List" functionality.

import 'package:flutter/cupertino.dart';
import '../entities/income.dart';
import 'database.dart';

class ViewModel extends ChangeNotifier{
  final BudgeDatabase _db;
  ViewModel(this._db);

  Future<List<Income>> get incomes async{
    return(await _db.incomeDao.findAllIncomes());
  }

  void addIncome() async{
    Income add = Income(1, "Hi", 1);
    await _db.incomeDao.insertIncome(add);
    notifyListeners();
  }


}