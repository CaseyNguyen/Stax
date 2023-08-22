
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
            value: SampleItem.itemOne,
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(Icons.settings),
                  Container(width: 8),
                  const Text('Settings')
                ]
            ),
          ),
          PopupMenuItem<SampleItem>(
            value: SampleItem.itemTwo,
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                Icon(Icons.delete_forever),
                Container(width: 8),
                Text('Purge Data')
              ]
            ),
            onTap: () {
              final model = Provider.of<ViewModel>(context, listen: false);
              model.deleteIncome();
              },
          ),
          PopupMenuItem<SampleItem>(
            value: SampleItem.itemThree,
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(Icons.newspaper),
                  Container(width: 8),
                  Text('Credits')
                ]
            ),
          ),
      ]
    );
  }
}