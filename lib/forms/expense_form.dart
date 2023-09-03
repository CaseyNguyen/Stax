// income_form.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.17.2023 - Created page. Added one field with no connections.
// 8.20.2023 - Added database connections; still need to fix incrementing ID.
// 8.21.2023 - Aligned to center. Added text formatting and labels.

import 'package:budge/database/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'decimal_formatter.dart';


class ExpenseForm extends StatefulWidget{
  const ExpenseForm({Key? key}) : super(key: key);
  @override
  _ExpenseFormState createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm>{
  final _formKey = GlobalKey<FormState>();
  final label = TextEditingController();
  final value = TextEditingController();
  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(title: const Text("Add Income"),
          centerTitle: true,
        ),
        body:
            Center(
              child:
                SizedBox(
                  width: screenWidth / 1.25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(height: 10), // Divider
                      const Text ("This is for"),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'Ex. Korean BBQ',
                        ),
                        controller: label,
                      ),
                      Container(height: 10), // Divider
                      const Text ("valued at"),
                      TextFormField(
                          textAlign: TextAlign.center,
                          inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
                          decoration: const InputDecoration(
                              prefixText: '\$',
                              hintText: '31.99'
                          ),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          controller: value,
                      ),
                      Container(height: 10), // Divider
                      Container(
                        color: const Color(0xFFFF6B6B),
                        width: screenWidth / 4,
                        child: TextButton(
                            child: const Text("Submit It", style: TextStyle(color: Colors.white, fontSize: 16)),
                            onPressed: (){
                              if (_formKey.currentState!.validate()) {
                                final model = Provider.of<ViewModel>(context, listen: false);
                                model.addIncome(1, label.text, double.parse(value.text));
                                Navigator.pop(context);
                              }
                            }
                        ),
                      )
                    ],
                  ),
                )
            )
      )
    );
  }
}