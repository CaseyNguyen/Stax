// top_buttons.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.21.2023 - Created top menu buttons. Only delete DB has functionality.
// 8.22.2023 - Alert dialog added to the delete button.

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/view_model.dart';

// This is the type used by the popup menu below.
enum SampleItem { itemOne, itemTwo, itemThree }

class TopButton extends StatefulWidget {
  const TopButton({super.key});

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  SampleItem? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
        initialValue: selectedMenu,
        // Callback that sets the selected popup menu item.
        onSelected: (SampleItem item) {
          setState(() {
            selectedMenu = item;
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
          PopupMenuItem<SampleItem>(
            value: SampleItem.itemTwo,
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                const Icon(Icons.delete_forever),
                Container(width: 8),
                const Text('Reset Data')
              ]
            ),
            onTap: () {
              log("Attempting to delete DB.");
              final snackBar = SnackBar(
                content: const Text('Deleted database information.'),
                action: SnackBarAction(
                  label: '',
                  onPressed: () {
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              final model = Provider.of<ViewModel>(context, listen: false);
              model.deleteIncome();
            },
          ),
          PopupMenuItem<SampleItem>(
            value: SampleItem.itemThree,
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(Icons.newspaper),
                  Container(width: 8),
                  const Text('Credits')
                ]
            ),
            onTap: () {}
          ),
      ]
    );
  }
}