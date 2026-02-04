import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/calculation.dart';
class OnPressedButtonWidget extends StatefulWidget {
  const OnPressedButtonWidget({super.key});

  @override
  State<OnPressedButtonWidget> createState() => _OnPressedButtonWidget();
}

class _OnPressedButtonWidget extends State<OnPressedButtonWidget> {
  String userInput = "";
  String result = "0";

  void onPressedButton(String value) {
    setState(() {
      if (value == 'AC') {
        userInput = "";
        result = "0";
      } else if (value == "DEL") {
        if (userInput.isNotEmpty) {
          userInput = userInput.substring(0, userInput.length - 1);
        }
      } else if (value == "=") {
        String input = userInput;
        if (!(input.contains('x') ||
            input.contains('-') ||
            input.contains('/') ||
            input.contains('+') ||
            input.contains('%'))) {
          result = input;
          return;
        }
        if (input.contains('x')) {
          var operaterPart = input.split('x');
          var calculate = Calculation(
            operand1: double.parse(operaterPart[0]),
            operand2: double.parse(operaterPart[1]),
            operator: 'x',
          );
          result = calculate.calculation().toString();
        } else if (input.contains('-')) {
          var operaterPart = input.split('-');
          var calculate = Calculation(
            operand1: double.parse(operaterPart[0]),
            operand2: double.parse(operaterPart[1]),
            operator: '-',
          );
          result = calculate.calculation().toString();
        } else if (input.contains('/')) {
          var operaterPart = input.split('/');
          var calculate = Calculation(
            operand1: double.parse(operaterPart[0]),
            operand2: double.parse(operaterPart[1]),
            operator: '/',
          );
          result = calculate.calculation().toString();
        } else if (input.contains('+')) {
          var operaterPart = input.split('+');
          var calculate = Calculation(
            operand1: double.parse(operaterPart[0]),
            operand2: double.parse(operaterPart[1]),
            operator: '+',
          );
          result = calculate.calculation().toString();
        } else if (input.contains('%')) {
          var operaterPart = input.split('%');
          var calculate = Calculation(
            operand1: double.parse(operaterPart[0]),
            operand2: double.parse(operaterPart[1]),
            operator: '%',
          );
          result = calculate.calculation().toString();
        }
        userInput = result;
      } else {
        userInput += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}