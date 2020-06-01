import 'package:calculator/model/Calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OperatorButton extends StatelessWidget {
  final Operator _operator;
  final VoidCallback _callback;
  final Calculator _calculator;

  OperatorButton(this._operator, this._callback, this._calculator);

  @override
  Widget build(BuildContext context) => BaseButton(
      text: Text(
        _op(),
        style: TextStyle(fontSize: 30, color: Color(0xff4A5BF3)),
      ),
      backgroundColor: Color(0xff030624),
      onTap: () {
        _calculator.onOperatorPressed(_operator);
        _callback.call();
      });

  String _op() {
    if (_operator == Operator.PERCENTAGE)
      return "%";
    else if (_operator == Operator.POW_TWO)
      return "x²";
    else if (_operator == Operator.SIGN)
      return "±";
    else if(_operator == Operator.INVERT)
      return "x⁻¹";
    else
      return "√";
  }
}

class NumberButton extends StatelessWidget {
  final int _number;
  final VoidCallback _callback;
  final Calculator _calculator;
  final int expand;

  NumberButton(this._number, this._callback, this._calculator, [this.expand = 1]);

  @override
  Widget build(BuildContext context) => BaseButton(
      text: Text(
        "$_number",
        style: TextStyle(fontSize: 30, color: Color(0xff868686)),
      ),
      backgroundColor: Color(0xff090D38),
      onTap: () {
        _calculator.onNumberPressed(_number);
        _callback.call();
      });
}

class OperationButton extends StatelessWidget {

  final String _operation;
  final VoidCallback _callback;
  final Calculator _calculator;

  OperationButton(this._operation, this._callback, this._calculator);

  @override
  Widget build(BuildContext context) => BaseButton(
      text: Text(
        _operation,
        style: TextStyle(fontSize: 30, color: Color(0xff4A5BF3)),
      ),
      backgroundColor: Color(0xff030624),
      onTap: () {
        _calculator.onOperationPressed(_operation);
        _callback.call();
      }
  );
}

class BaseButton extends StatelessWidget {
  final Text text;
  final Color backgroundColor;
  final VoidCallback onTap;
  final int expand;

  BaseButton({this.text, this.backgroundColor, this.onTap, this.expand = 1});

  @override
  Widget build(BuildContext context) => Expanded(
        flex: 1,
        child: GestureDetector(
          child: Container(
            constraints: BoxConstraints.expand(),
            child: FittedBox(
              alignment: Alignment.center,
              child: text,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              border: buttonOrder(),
            ),
          ),
          onTap: onTap,
        ),
      );
}

Border buttonOrder() {
  return Border.all(
    color: Color(0xff3BC7E5), //Color of the border
    style: BorderStyle.solid, //Style of the border
    width: 0.6, //width of the border
  );
}
