import 'package:flutter/material.dart';
import 'package:flutter_mini_calculator/utils/operation.dart';
import 'package:flutter_mini_calculator/view/widgets/calculator_button.dart';
import 'package:flutter_mini_calculator/view_model/calculator_view_model.dart';
import 'package:provider/provider.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CalculatorViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Arithmetic Calculator'),
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
                children: [
                  TextFormField(
                    controller: _firstController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter First Value',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _secondController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter Second Value',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    viewModel.result,
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
                        Operations.values.map((operator) {
                          return CalculatorButton(
                            operator: operator,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                viewModel.calculate(
                                  operationType: operator,
                                  firstText: _firstController.text,
                                  secondText: _secondController.text,
                                );
                              }
                            },
                          );
                        }).toList(),
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
