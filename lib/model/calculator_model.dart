class CalculatorModel {
  String calculate({
    required double firstNumber,
    required double secondNumber,
    required String operation,
  }) {
    try {
      final result =
          {
            '+': firstNumber + secondNumber,
            '-': firstNumber - secondNumber,
            '*': firstNumber * secondNumber,
            '/': firstNumber / secondNumber,
          }[operation];

      if (result == null) {
        return 'Error: Invalid operation';
      }
      return 'Result: $result';
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }
}
