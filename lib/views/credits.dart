import 'package:flutter/material.dart';

class Credits extends StatelessWidget{
  const Credits({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: const Text("Credits"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children:const [
              Text("Hello"),
            ]
          )
        ),
    );
  }
}