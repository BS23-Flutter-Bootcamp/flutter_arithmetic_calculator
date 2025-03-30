class CalculatorModel {
    String calculate(
    double firstNumber,
    double secondNumber,
    String operation,
  ) {
    final operations = <String, double Function()>{
      '+': () => firstNumber + secondNumber,
      '-': () => firstNumber - secondNumber,
      '*': () => firstNumber * secondNumber,
      '/': () => firstNumber/ secondNumber,
    };

    double calculationResult = operations[operation]!();

    // Ensure integer formatting if result is whole
    return calculationResult % 1 == 0
        ? 'Result: ${calculationResult.toInt()}'
        : 'Result: $calculationResult';
  }
}