import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/buttons.dart';
import 'package:flutter_calculator/widgets/calculation.dart';

class LandscapeLayout extends StatefulWidget {
  const LandscapeLayout({super.key});

  @override
  State<LandscapeLayout> createState() => _LandscapeLayoutState();
}

class _LandscapeLayoutState extends State<LandscapeLayout> {
  String userInput = "";
  String result = "0";

  bool isOperator(String value) => "+-x/%".contains(value);

  void onPressedButton(String value) {
    setState(() {
      if (value == 'AC') {
        userInput = "";
        result = "0";
        return;
      }


      if (value == "DEL") {
        if (userInput.isNotEmpty) {
          userInput = userInput.substring(0, userInput.length - 1);
        }
        return;
      }

      if (value == '-' && userInput.isEmpty) {
        userInput = '-';
        return;
      }

      if (isOperator(value) &&
          userInput.isNotEmpty &&
          isOperator(userInput[userInput.length - 1])) {
        return;
      }

      if (value == '.') {
        final parts = userInput.split(RegExp(r'[+\-x/%]'));
        if (parts.isNotEmpty && parts.last.contains('.')) return;
      }

      if (value == "=") {
        if (userInput.isEmpty ||
            isOperator(userInput[userInput.length - 1])) {
          return;
        }

        try {
          if (userInput.contains('x')) {
            var p = userInput.split('x');
            if (p.length != 2) return;
            result = Calculation(
              operand1: double.parse(p[0]),
              operand2: double.parse(p[1]),
              operator: 'x',
            ).calculation().toString();
          } else if (userInput.contains('/')) {
            var p = userInput.split('/');
            if (p.length != 2) return;
            result = Calculation(
              operand1: double.parse(p[0]),
              operand2: double.parse(p[1]),
              operator: '/',
            ).calculation().toString();
          } else if (userInput.contains('+')) {
            var p = userInput.split('+');
            if (p.length != 2) return;
            result = Calculation(
              operand1: double.parse(p[0]),
              operand2: double.parse(p[1]),
              operator: '+',
            ).calculation().toString();
          } else if (userInput.contains('-')) {
            var p = userInput.split('-');
            if (p.length != 2) return;
            result = Calculation(
              operand1: double.parse(p[0]),
              operand2: double.parse(p[1]),
              operator: '-',
            ).calculation().toString();
          } else if (userInput.contains('%')) {
            var p = userInput.split('%');
            if (p.length != 2) return;
            result = Calculation(
              operand1: double.parse(p[0]),
              operand2: double.parse(p[1]),
              operator: '%',
            ).calculation().toString();
          } else {
            result = userInput;
          }

          userInput = result;
        } catch (e) {
          result = "Error";
          userInput = "";
        }
        return;
      }

      userInput += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    userInput,
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    result,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.teal,
                      textColor: Colors.white,
                      buttonText: 'AC',
                      onPressed: () => onPressedButton('AC'),
                    ),
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.teal,
                      textColor: Colors.white,
                      buttonText: 'DEL',
                      onPressed: () => onPressedButton('DEL'),
                    ),
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.teal,
                      textColor: Colors.white,
                      buttonText: '%',
                      onPressed: () => onPressedButton('%'),
                    ),
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.teal,
                      textColor: Colors.white,
                      buttonText: '/',
                      onPressed: () => onPressedButton('/'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.white,
                      textColor: Colors.black,
                      buttonText: '9',
                      onPressed: () => onPressedButton('9'),
                    ),
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.white,
                      textColor: Colors.black,
                      buttonText: '8',
                      onPressed: () => onPressedButton('8'),
                    ),
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.white,
                      textColor: Colors.black,
                      buttonText: '7',
                      onPressed: () => onPressedButton('7'),
                    ),
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.teal,
                      textColor: Colors.white,
                      buttonText: 'x',
                      onPressed: () => onPressedButton('x'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.white,
                      textColor: Colors.black,
                      buttonText: '6',
                      onPressed: () => onPressedButton('6'),
                    ),
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.white,
                      textColor: Colors.black,
                      buttonText: '5',
                      onPressed: () => onPressedButton('5'),
                    ),
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.white,
                      textColor: Colors.black,
                      buttonText: '4',
                      onPressed: () => onPressedButton('4'),
                    ),
                    ButtonWidget(
                        height: 50,
                        width: 70,
                        color: Colors.teal,
                        textColor: Colors.white,
                        buttonText: '-',
                        onPressed: () => onPressedButton('-')
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.white,
                      textColor: Colors.black,
                      buttonText: '3',
                      onPressed: () => onPressedButton('3'),
                    ),
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.white,
                      textColor: Colors.black,
                      buttonText: '2',
                      onPressed: () => onPressedButton('2'),
                    ),
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.white,
                      textColor: Colors.black,
                      buttonText: '1',
                      onPressed: () => onPressedButton('1'),
                    ),
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.teal,
                      textColor: Colors.black,
                      buttonText: '+',
                      onPressed: () => onPressedButton('+'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.white,
                      textColor: Colors.black,
                      buttonText: '0',
                      onPressed: () => onPressedButton('0'),
                    ),
                    ButtonWidget(
                      height: 50,
                      width: 70,
                      color: Colors.white,
                      textColor: Colors.black,
                      buttonText: '.',
                      onPressed: () => onPressedButton('.'),
                    ),
                    ButtonWidget(
                      height: 50,
                      width: 270,
                      color: Colors.yellow,
                      textColor: Colors.black,
                      buttonText: "=",
                      onPressed: () => onPressedButton('='),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
