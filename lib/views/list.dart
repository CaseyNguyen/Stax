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
import '../forms/edit_form.dart';

class TransactionList extends StatefulWidget{
  const TransactionList({super.key});
  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList>{
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
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16))
            );
          } return ListView.builder(
            itemCount: view.length,
            itemBuilder: (context, index) =>
                Card(
                  child: ListTile(
                    title: ShowType(type: view[index].type),
                    subtitle: Text('from ${view[index].name}'),
                    trailing: Text('\$${view[index].value.toStringAsFixed(2)}'),
                    onTap: () async => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text(view[index].name),
                        content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () async {
                              Navigator.pop(context, 'Edit');
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EditForm(view: view[index])),
                              );
                            },
                            child: const Text('Edit'),
                          ),
                          TextButton(
                            onPressed: () async {
                              model.deleteTransaction(view[index]);
                              Navigator.pop(context, 'Delete');
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    ),
                    //
                  )
                )
          );
        }
        return const Text("Recent activity is empty.");
      }
    );
  }
}