import 'package:flutter/material.dart';
import 'package:flutter_mini_calculator/model/calculator_model.dart';
import 'package:flutter_mini_calculator/utils/operation.dart';

class CalculatorViewModel extends ChangeNotifier {
  final CalculatorModel _model = CalculatorModel();
  late final operations = {
    Operations.add: _model.add,
    Operations.subtract: _model.subtract,
    Operations.multiply: _model.multiply,
    Operations.divide: _model.divide,
  };
  String _result = '';
  String get result => _result;

  void calculate({
    required Operations operationType,
    required String firstText,
    required String secondText,
  }) {
    final firstNumber = double.tryParse(firstText);
    final secondNumber = double.tryParse(secondText);

    if (firstNumber == null || secondNumber == null) {
      _result = "Invalid input: Please enter valid numbers.";
    } else {
      try {
        final operationFunction = operations[operationType];
        if (operationFunction != null) {
          _result =
              'Result: ${operationFunction(firstNumber, secondNumber).toString()}';
        } else {
          _result = "Error: Unsupported Operation";
        }
      } catch (error) {
        _result = error.toString();
      }
    }

    notifyListeners();
  }
}
