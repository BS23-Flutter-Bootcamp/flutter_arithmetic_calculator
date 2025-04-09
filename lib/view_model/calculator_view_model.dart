import 'package:flutter/material.dart';
import 'package:flutter_mini_calculator/model/calculator_model.dart';

class CalculatorViewModel extends ChangeNotifier {
  final CalculatorModel _model = CalculatorModel();
  String _result = '';
  String get result => _result;

  void calculate({
    required String operationType,
    required String firstText,
    required String secondText,
  }) {
    final firstNumber = double.tryParse(firstText);
    final secondNumber = double.tryParse(secondText);

    if (operationType == '/' && secondNumber == 0) {
      _result = 'Error: Division by zero.';
    } else {
      _result = _model.calculate(
        firstNumber: firstNumber!,
        secondNumber: secondNumber!,
        operation: operationType,
      );
    }

    notifyListeners();
  }
}
