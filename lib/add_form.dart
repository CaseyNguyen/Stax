// add_form.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.17.2023 - Created page. Added one field with no connections.
// 8.20.2023 - Fixed data connections, still need to fix incrementing ID.

import 'package:budge/database/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'entities/income.dart';

class IncomeForm extends StatefulWidget{
  const IncomeForm({Key? key}) : super(key: key);
  @override
  _IncomeFormState createState() => _IncomeFormState();
}

class _IncomeFormState extends State<IncomeForm>{
  final _formKey = GlobalKey<FormState>();
  final label = TextEditingController();
  final value = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(title: const Center(child: Text("")),
          centerTitle: true,
        ),
        body:
        SizedBox(
          child: Column(
            children: [
              const Text ("This is from a..."),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Label',
                ),
                controller: label,
              ),
              const Text ("...valued at..."),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Value'
                ),
                keyboardType: TextInputType.number,
                controller: value,
              ),
              ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      final model = Provider.of<ViewModel>(context, listen: false);
                      Income addIncome = Income(3, label.toString(),
                          double.parse(value.text));
                      model.addIncome(addIncome);
                      Navigator.pop(context);
                    }
                  }
              ),
            ],
          ),
        )
      )
    );
  }
}