// top_buttons.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.21.2023 - Created top menu buttons. Only delete DB has functionality.
// 8.22.2023 - Alert dialog added to the delete button.

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../alert/credits.dart';
import '../database/view_model.dart';

// This is the type used by the popup menu below.

class TopButton extends StatefulWidget {
  const TopButton({super.key});
  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        // Callback that sets the selected popup menu item.
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                const Icon(Icons.delete_forever),
                Container(width: 8),
                const Text('Reset Data')
              ]
            ),
            onTap: () async {
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
          PopupMenuItem(
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(Icons.newspaper),
                  Container(width: 8),
                  const Text('Credits')
                ]
            ),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Credits()),
              );
            }
    ),
      ]
    );
  }
}