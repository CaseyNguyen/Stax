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

  // addIncome
  void addIncome(Income income) async{
    await _db.incomeDao.insertIncome(income);
    notifyListeners();
  }
}