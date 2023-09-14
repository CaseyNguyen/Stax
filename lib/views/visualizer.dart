// visualizer.dart
// Created by Casey Nguyen
// VERSION CONTROL:
// 8.21.2023 - Created a clean way to visualize the money. The column is
// currently causing a RenderFlex error which needs to be addressed.
// 8.22.2023 - RenderFlex error resolved. Ready cash shows two decimals.

import 'package:budge/database/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../blocks/report.dart';
import '../blocks/utilization.dart';

class DataVisualizer extends StatefulWidget {
  const DataVisualizer({super.key});
  @override
  State<DataVisualizer> createState() => _DataVisualizerState();
}

class _DataVisualizerState extends State<DataVisualizer>{
  @override
  Widget build(BuildContext context){
    final model = context.watch<ViewModel>();
    final money = model.balance;
    return Center(
      child: FutureBuilder(
          future: money,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final view = snapshot.data!;
                return Column(
                children: [
                  Container(height: 30),
                  Text('\$${(view[2]).toStringAsFixed(2)}', style: const TextStyle(fontSize: 40)),
                  Container(height: 30),
                  Flexible(
                    child:
                      CircularPercentIndicator(
                        radius: 120.0,
                        lineWidth: 40.0,
                        percent: view[4],
                        center: Utilization(percent: view[3]),
                        progressColor: Colors.green,
                      )
                  ),
                  Container(height: 30),
                  UtilizationReport(view: view),
                ]
              );
            } return const Center(
                child:
                SizedBox( width: 75, height: 75, child: CircularProgressIndicator(
                  color: Colors.blueGrey,
                  strokeWidth: 10,
                ))
            );
          }
      ),
    );
  }
}