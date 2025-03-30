import 'package:flutter/material.dart';
import 'package:flutter_mini_calculator/domain/models/calculator_model.dart';

class CalculatorViewModel extends ChangeNotifier {
  final CalculatorModel _model = CalculatorModel();

  String _result = '';
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final List<String> _operations = ['+', '-', '*', '/'];
  final _formKey = GlobalKey<FormState>();

  String get result => _result;
  TextEditingController get firstController => _firstController;
  TextEditingController get secondController => _secondController;
  List<String> get operations => _operations;
  GlobalKey<FormState> get formKey => _formKey;

  void calculate(String operation) {
    final firstText = _firstController.text;
    final secondText = _secondController.text;

    if (formKey.currentState?.validate() == false) {
      _result = 'Error: Values cannot be null.';
      return;
    } else {
      final firstNumber = double.tryParse(firstText);
      final secondNumber = double.tryParse(secondText);

      if (firstNumber == null || secondNumber == null) {
        _result = 'Error: Invalid number format.';
      } else if (operation == '/' && secondNumber == 0) {
        _result = 'Error: Division by zero.';
      } else {
        _result = _model.calculate(firstNumber, secondNumber, operation);
      }
    }
    notifyListeners();
  }

  void clear() {
    _result = '';
    notifyListeners();
  }
}
