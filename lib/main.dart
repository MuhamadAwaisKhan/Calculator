import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      title: ' Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.lightBlue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimal");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText, Color color, Color textColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),  // Added margin for spacing
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(24.0),
            textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          child: Text(buttonText, style: TextStyle(color: textColor)),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator',style: TextStyle(fontWeight: FontWeight.bold),),
      centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),

      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(output, style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          const Expanded(child: Divider()),
          Column(children: [
            Row(children: [
              buildButton("7", Colors.blueGrey[700]!, Colors.white),
              buildButton("8", Colors.blueGrey[700]!, Colors.white),
              buildButton("9", Colors.blueGrey[700]!, Colors.white),
              buildButton("/", Colors.red, Colors.white),
            ]),
            Row(children: [
              buildButton("4", Colors.blueGrey[700]!, Colors.white),
              buildButton("5", Colors.blueGrey[700]!, Colors.white),
              buildButton("6", Colors.blueGrey[700]!, Colors.white),
              buildButton("*", Colors.red, Colors.white),
            ]),
            Row(children: [
              buildButton("1", Colors.blueGrey[700]!, Colors.white),
              buildButton("2", Colors.blueGrey[700]!, Colors.white),
              buildButton("3", Colors.blueGrey[700]!, Colors.white),
              buildButton("-", Colors.red, Colors.white),
            ]),
            Row(children: [
              buildButton(".", Colors.blueGrey[700]!, Colors.white),
              buildButton("0", Colors.blueGrey[700]!, Colors.white),
              buildButton("00", Colors.blueGrey[700]!, Colors.white),
              buildButton("+", Colors.red, Colors.white),
            ]),
            Row(children: [
              buildButton("CLEAR", Colors.green[700]!, Colors.white),
              buildButton("=", Colors.red, Colors.white),
            ]),
          ])
        ],
      ),
    );
  }
}
