import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController firstController = TextEditingController(),
      secondController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> operations = ['+', '-', '×', '÷'];
  String result = '';

  void calculate(String operation) {
    try {
      double? firstNumber = double.tryParse(
        firstController.text,
      ); // Returns null if input is invalid
      double? secondNumber = double.tryParse(secondController.text);

      if (_formKey.currentState?.validate() == false) {
        setState(() => result = 'Error: Values can not be null.');
        return;
      }
      setState(
        () =>
            result = _performCalculation(
              firstNumber!,
              secondNumber!,
              operation,
            ),
      );
    } catch (e) {
      setState(() => result = 'Error: Unexpected error occurred.');
    }
  }

  String _performCalculation(
    double firstNumber,
    double secondNumber,
    String operation,
  ) {
    final operations = <String, double Function()>{
      '+': () => firstNumber + secondNumber,
      '-': () => firstNumber - secondNumber,
      '×': () => firstNumber * secondNumber,
      '÷': () => _divide(firstNumber, secondNumber),
    };

    double calculationResult = operations[operation]!();

    // Ensure integer formatting if result is whole
    return calculationResult % 1 == 0
        ? 'Result: ${calculationResult.toInt()}'
        : 'Result: $calculationResult';
  }

  double _divide(double firstNumber, double secondNumber) {
    if (secondNumber == 0) {
      throw Exception('Division by zero is not allowed.');
    }
    return firstNumber / secondNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Calculator'),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: firstController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter First Value',
                      border: OutlineInputBorder(),
                    ),
                    validator:
                        (value) =>
                            value!.isEmpty ? 'Please enter a value' : null,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: secondController,
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                      labelText: 'Enter Second Value',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field cannot be empty';
                      }
                      return null; // Valid input
                    },
                  ),

                  SizedBox(height: 16.0),
                  Text(
                    result,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    alignment: WrapAlignment.center,
                    children:
                        operations
                            .map(
                              (operation) => ElevatedButton(
                                onPressed: () {
                                  calculate(operation);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(100, 50),
                                  backgroundColor: Colors.deepPurple[100],
                                ),
                                child: Text(
                                  operation,
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}