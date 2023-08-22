// visualizer.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.21.2023 - Created a clean way to visualize the money. The column is
// currently causing a RenderFlex error which needs to be addressed.

import 'package:budge/database/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DataVisualizer extends StatelessWidget{
  const DataVisualizer({super.key});
  @override
  Widget build(BuildContext context){
    final model = context.watch<ViewModel>();
    final money = model.totalIncome;
    return FutureBuilder(
        future: money,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final view = snapshot.data!;
              return Column(
              children: [
                Container(height: 20),
                const Text('Ready Cash:', style: TextStyle(fontSize: 20)),
                Text('\$${view.toString()}', style: const TextStyle(fontSize: 40)),
                Container(height: 30),
                Flexible(
                  child:
                    CircularPercentIndicator(
                      radius: 120.0,
                      lineWidth: 40.0,
                      percent: 0.9,
                      center: Text('${view.toString()}%', style: const TextStyle(fontSize: 40)),
                      progressColor: Colors.green,
                    )
                )
              ]

            );

          }
          return const Text("Recent activity is empty.");
        }
    );
  }
}