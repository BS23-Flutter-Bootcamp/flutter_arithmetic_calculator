import 'package:flutter/material.dart';
import 'package:flutter_mini_calculator/ui/calculator/view_model/calculator_view_model.dart';
import 'package:flutter_mini_calculator/ui/core/calculator_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(viewModel: CalculatorViewModel()),
      debugShowCheckedModeBanner: false,
    );
  }
}


