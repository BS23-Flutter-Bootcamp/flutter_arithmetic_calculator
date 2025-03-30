import 'package:flutter/material.dart';
import 'package:flutter_mini_calculator/ui/calculator/view_model/calculator_view_model.dart';

class CalculatorScreen extends StatelessWidget {
  final CalculatorViewModel viewModel;

  const CalculatorScreen({
    super.key,
    required this.viewModel
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arithmetic Calculator'),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
          child: ListenableBuilder(
            listenable: viewModel,
            builder:
                (context, child) => SingleChildScrollView(
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: viewModel.firstController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Enter First Value',
                            border: OutlineInputBorder(),
                          ),
                          validator:
                              (value) =>
                                  value!.isEmpty
                                      ? 'Please enter a value'
                                      : null,
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: viewModel.secondController,
                          keyboardType: TextInputType.number,

                          decoration: InputDecoration(
                            labelText: 'Enter Second Value',
                            border: OutlineInputBorder(),
                          ),
                          validator:
                              (value) =>
                                  value!.isEmpty
                                      ? 'Please enter a value'
                                      : null,
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
                              viewModel.operations
                                  .map(
                                    (operation) => ElevatedButton(
                                      onPressed: () {
                                        viewModel.calculate(operation);
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
      ),
    );
  }
}
