import 'package:flutter/material.dart';

class UtilizationReport extends StatelessWidget{
  UtilizationReport({required this.view, super.key});
  List<double> view;
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        const Text('Financial Report', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24
        )),
        (view[0] == 0 || view[1] == 0) ?
          Container() :
          Text('You have used ${((view[5]).toStringAsFixed(2))}% of reported income.'),
        Text('You have reported \$${(view[0].toStringAsFixed(2))} in income.'),
        Text('You have reported \$${(view[1].toStringAsFixed(2))} in expenses.'),
      ]
    );
  }
}