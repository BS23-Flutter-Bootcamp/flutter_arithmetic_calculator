import 'package:flutter/material.dart';
import 'package:flutter_mini_calculator/utils/operation.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.operator,
    required this.onPressed,
  });

  final Operations operator;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(120, 50),
        backgroundColor: Colors.deepPurple[100],
      ),
      child: Text(operator.name, style: const TextStyle(fontSize: 15)),
    );
  }
}
