import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.formKey,
    required this.viewModel,
    required this.operator,
    required this.firstController,
    required this.secondController,
  });

  final GlobalKey<FormState> formKey;
  final dynamic viewModel;
  final String operator;
  final TextEditingController firstController;
  final TextEditingController secondController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          viewModel.calculate(
            operationType: operator,
            firstText: firstController.text,
            secondText: secondController.text,
          );
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(100, 50),
        backgroundColor: Colors.deepPurple[100],
      ),
      child: Text(operator, style: const TextStyle(fontSize: 24)),
    );
  }
}
