import 'package:flutter/material.dart';



class Utilization extends StatelessWidget{
  Utilization({required this.percent, super.key});
  double percent;
  @override
  Widget build(BuildContext context){
    if (percent < 0){
      return const Text('Deficit', style: const TextStyle(fontSize: 30, color: Colors.red));
    }
    return Text('${(percent).toStringAsFixed(2)}%',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30)
    );
  }
}