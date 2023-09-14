// list.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.18.2023 - Created to very neatly hold transaction list.
// 8.21.2023 - Fixed doubles to only show two decimals.
// 9.14.2023 - Overhauled listview.

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
          if (view.isEmpty) {
            return const Center(
              child: Text("You have no transactions so far.\nUse the + or - buttons to add income/expense.",
              textAlign: TextAlign.center)
            );
          } return ListView.builder(
            itemCount: view.length,
            itemBuilder: (context, index) =>
                Card(
                  child: ListTile(
                    title: ShowType(type: view[index].type),
                    subtitle: Text('from ${view[index].name}'),
                    trailing: Text('\$${view[index].value.toStringAsFixed(2)}'),
                    onTap: () {},
                  )
                )
          );
        }
        return const Text("Recent activity is empty.");
      }
    );
  }
}