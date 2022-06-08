import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:math_expressions/math_expressions.dart';

class Main_Function extends StatefulWidget {
  @override
  State<Main_Function> createState() => _Main_FunctionState();
}

class _Main_FunctionState extends State<Main_Function> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
  String buttonText = "";

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        equation = "0";
        result = "0";
      } else if (buttonText == "<-") {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        equation = "0";

        expression = equation;
        expression = expression.replaceAll("+", "+");
        expression = expression.replaceAll("x", "*");
        expression = expression.replaceAll("", "");
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "error";
        }
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(
      String ButtonText, double buttonHeight, Color ButtonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: ButtonColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mini Calculator")),
      body: ListView(children: [
        SizedBox(height: 50),
        Row(
          children: <Widget>[
            SizedBox(
              width: 150,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/1.jpg"),
              )),
            ),
            SizedBox(),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/matahari.jpg"),
              )),
            ),
          ],
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Text(
            equation,
            style: TextStyle(fontSize: equationFontSize),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Text(
            result,
            style: TextStyle(fontSize: resultFontSize),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Row(
          children: [
            SizedBox(width: 55),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    primary: Colors.black,
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, right: 15, left: 15)),
                onPressed: () => buttonPressed(buttonText),
                child: Text("AC")),
            SizedBox(width: 15),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  primary: Colors.black,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                ),
                onPressed: () => buttonPressed(buttonText),
                child: Text("+/-")),
            SizedBox(width: 15),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  primary: Colors.black,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                ),
                onPressed: () => buttonPressed(buttonText),
                child: Text("%")),
            SizedBox(width: 15),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  primary: Colors.black,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                ),
                onPressed: () => buttonPressed(buttonText),
                child: Text("/"))
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            SizedBox(width: 55),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    primary: Colors.black,
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, right: 15, left: 15)),
                onPressed: () => buttonPressed(buttonText),
                child: Text("7")),
            SizedBox(width: 15),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  primary: Colors.black,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                ),
                onPressed: () => buttonPressed(buttonText),
                child: Text("8")),
            SizedBox(width: 15),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  primary: Colors.black,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                ),
                onPressed: () => buttonPressed(buttonText),
                child: Text("9")),
            SizedBox(width: 15),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  primary: Colors.black,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                ),
                onPressed: () => buttonPressed(buttonText),
                child: Text("X")),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            SizedBox(width: 55),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    primary: Colors.black,
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, right: 15, left: 15)),
                onPressed: () => buttonPressed(buttonText),
                child: Text("4")),
            SizedBox(width: 15),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  primary: Colors.black,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                ),
                onPressed: () => buttonPressed(buttonText),
                child: Text("5")),
            SizedBox(width: 15),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  primary: Colors.black,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                ),
                onPressed: () => buttonPressed(buttonText),
                child: Text("6")),
            SizedBox(width: 15),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  primary: Colors.black,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                ),
                onPressed: () => buttonPressed(buttonText),
                child: Text("-")),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            SizedBox(width: 55),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    primary: Colors.black,
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, right: 15, left: 15)),
                onPressed: () => buttonPressed(buttonText),
                child: Text("1")),
            SizedBox(width: 15),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  primary: Colors.black,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                ),
                onPressed: () => buttonPressed(buttonText),
                child: Text("2")),
            SizedBox(width: 15),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  primary: Colors.black,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                ),
                onPressed: () => buttonPressed(buttonText),
                child: Text("3")),
            SizedBox(width: 15),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  primary: Colors.black,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                ),
                onPressed: () => buttonPressed(buttonText),
                child: Text("+")),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            SizedBox(width: 55),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.amber,
                    primary: Colors.black,
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, right: 15, left: 15)),
                onPressed: () => buttonPressed(buttonText),
                child: Text("<-")),
            SizedBox(width: 15),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  primary: Colors.black,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                ),
                onPressed: () => buttonPressed(buttonText),
                child: Text("0")),
            SizedBox(width: 15),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.amber,
                  primary: Colors.black,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                ),
                onPressed: () => buttonPressed(buttonText),
                child: Text(".")),
            SizedBox(width: 15),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  primary: Colors.black,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                ),
                onPressed: () => buttonPressed(buttonText),
                child: Text("=")),
          ],
        ),
      ]),
    );
  }
}
