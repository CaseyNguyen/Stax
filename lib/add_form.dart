// add_form.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.17.2023 - Created page. Added one field with no connections.
// 8.20.2023 - Added database connections; still need to fix incrementing ID.
// 8.21.2023 - Aligned to center. Added text formatting and labels.

import 'package:budge/database/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'entities/income.dart';
import 'dart:math' as math;


class IncomeForm extends StatefulWidget{
  const IncomeForm({Key? key}) : super(key: key);
  @override
  _IncomeFormState createState() => _IncomeFormState();
}

// Code is repurposed from Ajay Kumar. Special thanks!
class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);
  final int decimalRange;
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, // unused.
      TextEditingValue newValue,
      ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}

class _IncomeFormState extends State<IncomeForm>{
  final _formKey = GlobalKey<FormState>();
  final label = TextEditingController();
  final value = TextEditingController();
  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(title: const Center(child: Text("")),
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
                      const Text ("This is from a..."),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'Paycheck',
                        ),
                        controller: label,
                      ),
                      Container(height: 10), // Divider
                      const Text ("...valued at..."),
                      TextFormField(
                          textAlign: TextAlign.center,
                          inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
                          decoration: const InputDecoration(
                              prefixText: '\$',
                              hintText: '40.99'
                          ),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          controller: value,
                      ),
                      Container(height: 10), // Divider
                      Container(
                        color: const Color(0XFF65AFFF),
                        width: screenWidth / 4,
                        child: TextButton(
                            child: const Text("Submit", style: TextStyle(color: Colors.white, fontSize: 16)),
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
                      )
                    ],
                  ),
                )
            )

      )
    );
  }
}