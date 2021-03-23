import 'package:flutter/material.dart';
import 'package:flutter_calculator_bloc/src/resources/calculator_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(title: 'Calculator'),
    );
  }
}