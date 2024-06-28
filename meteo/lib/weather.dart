import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Météo",
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Expanded(
          child: TextField(
            decoration: InputDecoration(),
          ),
        ),
      ),
    );
  }
}