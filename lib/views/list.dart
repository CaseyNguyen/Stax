// list.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.18.2023 - Created to very neatly hold transaction list.
// 8.21.2023 - Fixed doubles to only show two decimals.

import 'package:budge/database/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocks/show_type.dart';

class TransactionList extends StatelessWidget{
  const TransactionList({super.key});
  @override
  Widget build(BuildContext context){
    final model = context.watch<ViewModel>();
    final list = model.incomes;
    return FutureBuilder(
      future: list,
      builder: (context, snapshot){
        if (snapshot.hasData){
          final view = snapshot.data!;
          return ListView.builder(
            itemCount: view.length,
            itemBuilder: (context, index) =>
                Card(
                  child: ExpansionTile(
                    title: ShowType(type: view[index].type),
                    subtitle: Text('from ${view[index].name}'),
                    trailing: Text('\$${view[index].value.toStringAsFixed(2)}')
                  )
                )
          );
        }
        return const Text("Recent activity is empty.");
      }
    );
  }
}