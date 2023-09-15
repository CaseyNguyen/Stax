import 'package:flutter/material.dart';

class Balance extends StatelessWidget{
  Balance({required this.balance, super.key});
  double balance;
  @override
  Widget build(BuildContext context){
    if (balance > 0){
      return Column(
          children:[
            const Text('Balance:', style: TextStyle(color: Colors.white, fontSize: 24)),
            Text('\$${balance.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.greenAccent  , fontSize: 40)
            ),
          ]
        );
    }
    else if (balance < 0){
      return Column(
          children:[
            const Text('Balance:', style: TextStyle(color: Colors.white, fontSize: 24)),
            Text('-\$${(balance*=-1).toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.redAccent, fontSize: 40),
            )
          ]
      );
    }
    return Column(
        children:[
          const Text('Balance:', style: TextStyle(color: Colors.white, fontSize: 24)),
          Text('\$${balance.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.white, fontSize: 40)
          ),
        ]
    );
  }
}