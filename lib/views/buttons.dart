// buttons.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.18.2023 - Created to display buttons for creating transactions.
// 8.21.2023 - Updated to match final design (solid color). Added expense form
// connection.

import 'package:budge/forms/income_form.dart';
import 'package:flutter/material.dart';
import '../forms/expense_form.dart';

class TransactionButton extends StatelessWidget{
  const TransactionButton({super.key});
  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    return Wrap(
      alignment: WrapAlignment.center,
      children:[
        Container(
          height: 75,
          width: screenWidth / 2,
          color: const Color(0xFF4CAF50),
          child: TextButton(
            child: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IncomeForm()),
              );},
          ),
        ),
        Container(
          height: 75,
          width: screenWidth / 2,
          color: const Color(0xFFFF5722),
          child: TextButton(
              child: const Icon(Icons.remove, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExpenseForm()),
                );
              },
              ),
          ),
      ]
    );
  }
}