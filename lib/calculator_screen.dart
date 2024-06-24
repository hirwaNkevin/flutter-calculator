import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';

class Calculatorscreen extends StatefulWidget {
  const Calculatorscreen({super.key});

  @override
  State<Calculatorscreen> createState() => _CalculatorscreenState();
}

class _CalculatorscreenState extends State<Calculatorscreen> {
  // int _counter = 0;

  // void _eg(int i) {
  //   setState(() {
  //     _counter += i;
  //   });
  // }
  static String _inputExpression = '';
  static String _output = '';
  void displayContentInTextBar(String input) {
    setState(() {
      _inputExpression = _inputExpression + input;
    });
  }

  void clearContentFromTextBar() {
    setState(() {
      _inputExpression = '';
    });
  }

  void evaluateInput() {
    setState(() {
      final expression = Expression.parse(_inputExpression);
      final evaluator = const ExpressionEvaluator();
      _output = '' + evaluator.eval(expression, {}).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                SizedBox(
                  height: 50.0,
                  child: Container(
                    height: 20,
                    child: Text(
                      // input
                      _inputExpression,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                      overflow: TextOverflow.visible,
                      maxLines: 3,
                      softWrap: true,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                SizedBox(
                  height: 50.0,
                  child: Container(
                    height: 20,
                    child: Text(
                      // input
                      _output,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.visible,
                      maxLines: 3,
                      softWrap: true,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            displayContentInTextBar('1');
                          },
                          child: const Text('1')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            displayContentInTextBar('2');
                          },
                          child: const Text('2')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            displayContentInTextBar('3');
                          },
                          child: const Text('3')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            displayContentInTextBar('+');
                          },
                          child: const Text('+')),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            displayContentInTextBar('4');
                          },
                          child: const Text('4')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            displayContentInTextBar('5');
                          },
                          child: const Text('5')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            displayContentInTextBar('6');
                          },
                          child: const Text('6')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            displayContentInTextBar('-');
                          },
                          child: const Text('-')),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            displayContentInTextBar('7');
                          },
                          child: const Text('7')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            displayContentInTextBar('8');
                          },
                          child: const Text('8')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            displayContentInTextBar('9');
                          },
                          child: const Text('9')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            displayContentInTextBar('*');
                          },
                          child: const Text('*')),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            displayContentInTextBar('0');
                          },
                          child: const Text('0')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            displayContentInTextBar('/');
                          },
                          child: const Text('/')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            clearContentFromTextBar();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // Background color
                          ),
                          child: const Text(
                            'C',
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            evaluateInput();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .primary, // Background color
                          ),
                          child: const Text(
                            '=',
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
