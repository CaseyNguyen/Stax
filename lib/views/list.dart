import 'package:budge/database/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
                  child: ListTile(
                    onTap: () {},
                    title: Text(view[index].name),
                    subtitle: Text(view[index].value.toString()),
                  )
                )
          );
        }
        return const Text("Recent activity is empty.");
      }
    );
  }
}