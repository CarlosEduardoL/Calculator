import 'package:calculator/model/Calculator.dart';
import 'package:calculator/view/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class KeyBoard extends StatelessWidget {
  final VoidCallback update;
  final Calculator calculator;

  KeyBoard(this.update, this.calculator);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              OperatorButton(Operator.POW_TWO, update, calculator),
              OperatorButton(Operator.SQUARE_ROOT, update, calculator),
              BaseButton(
                text: Text("C",
                    style: TextStyle(fontSize: 30, color: Color(0xff4A5BF3))),
                backgroundColor: Color(0xff030624),
                onTap: () {
                  calculator.onRemoveAll();
                  update();
                },
              ),
              BaseButton(
                text: Text("⌫",
                    style: TextStyle(fontSize: 30, color: Color(0xff4A5BF3))),
                backgroundColor: Color(0xff030624),
                onTap: () {
                  calculator.onRemoveLast();
                  update();
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              OperatorButton(Operator.PERCENTAGE, update, calculator),
              OperatorButton(Operator.SIGN, update, calculator),
              OperatorButton(Operator.INVERT, update, calculator),
              OperationButton("÷", update, calculator),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              NumberButton(1, update, calculator),
              NumberButton(2, update, calculator),
              NumberButton(3, update, calculator),
              OperationButton("×", update, calculator),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              NumberButton(4, update, calculator),
              NumberButton(5, update, calculator),
              NumberButton(6, update, calculator),
              OperationButton("-", update, calculator),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              NumberButton(7, update, calculator),
              NumberButton(8, update, calculator),
              NumberButton(9, update, calculator),
              OperationButton("+", update, calculator),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BaseButton(
                    text: Text(".",
                        style:
                            TextStyle(fontSize: 30, color: Color(0xff4A5BF3))),
                    backgroundColor: Color(0xff030624),
                    onTap: () {
                      calculator.onDotPressed();
                      update();
                    },
                  ),
                  NumberButton(0, update, calculator, 2),
                  BaseButton(
                    text: Text("=",
                        style:
                        TextStyle(fontSize: 30, color: Color(0xff4A5BF3))),
                    backgroundColor: Color(0xff030624),
                    onTap: () {
                      calculator.onEquals();
                      update();
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ))
      ],
    );
  }
}
