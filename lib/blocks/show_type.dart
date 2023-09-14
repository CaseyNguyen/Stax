import 'package:flutter/material.dart';

class ShowType extends StatelessWidget{
  ShowType({required this.type, super.key});
  int type;
  @override
  Widget build(BuildContext context){
    return type == 0 ?
    const Text(
      "Income",
      style: TextStyle(
        color: Colors.green,
      )
    ) :
    const Text(
        "Expense",
        style: TextStyle(
          color: Colors.red,
        )
    );
  }
}

