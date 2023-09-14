// income_form.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.17.2023 - Created page. Added one field with no connections.
// 8.20.2023 - Added database connections; still need to fix incrementing ID.
// 8.21.2023 - Aligned to center. Added text formatting and labels.

import 'package:budge/database/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocks/divider.dart';
import 'decimal_formatter.dart';

class IncomeForm extends StatefulWidget{
  const IncomeForm({Key? key}) : super(key: key);
  @override
  IncomeFormState createState() => IncomeFormState();
}

class IncomeFormState extends State<IncomeForm>{
  final _formKey = GlobalKey<FormState>();
  final label = TextEditingController();
  final value = TextEditingController();
  final tag = TextEditingController();
  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(title: const Text("Income"),
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
                      const CustomDivider(), // Divider
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.drive_file_rename_outline, color: Colors.grey),
                          hintText: 'Title',
                        ),
                        controller: label,
                      ),
                      const CustomDivider(),
                      TextFormField(
                          inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.attach_money, color: Colors.grey),
                              hintText: 'Value'
                          ),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          controller: value,
                      ),
                      const CustomDivider(),
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.bookmark_add_outlined, color: Colors.grey),
                            hintText: 'Tags (optional)'
                        ),
                        controller: tag,
                      ),
                      const CustomDivider(),
                      SizedBox(
                        width: screenWidth / 4,
                        child: OutlinedButton(
                            child: const Text("Enter", style: TextStyle(color: Colors.white, fontSize: 16)),
                            onPressed: (){
                              if (_formKey.currentState!.validate()) {
                                final model = Provider.of<ViewModel>(context, listen: false);
                                model.addIncome(0, label.text, double.parse(value.text));
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