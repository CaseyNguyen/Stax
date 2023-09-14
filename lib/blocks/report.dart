import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UtilizationReport extends StatelessWidget{
  UtilizationReport({required this.view, super.key});
  List<double> view;
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        const Text('Stax Report', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
        )),
        (view[0] == 0 || view[1] == 0) ?
          Container() :
          Text('You have used ${(myFormat.format(view[5]))}% of reported income.'),
        Text('You have reported \$${(myFormat.format(view[0]))} in income.'),
        Text('You have reported \$${(myFormat.format(view[1]))} in expenses.'),
      ]
    );
  }
}