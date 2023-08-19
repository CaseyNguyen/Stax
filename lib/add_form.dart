// add_form.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.17.2023 - Created page. Added one field with no connections.

import 'package:flutter/material.dart';

class AddForm extends StatefulWidget{
  const AddForm({Key? key}) : super(key: key);
  @override
  _AddFormState createState() => _AddFormState();
}

void addIncome(String label, int value){

}


class _AddFormState extends State<AddForm>{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Label',
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Value'
            ),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
              child: const Text("Submit"),
              onPressed: (){}
          ),
        ],
      ),
    );
  }
}