import 'package:calculator/model/Calculator.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final Calculator calculator;

  Display(this.calculator);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Container(
              child: FittedBox(
                  child: Text(
                calculator.getResult(),
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.white),
              )),
              padding: EdgeInsets.all(20),
            )),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text(
                  calculator.getOperator(),
                  style: TextStyle(color: Color(0xff9B9B9B), fontSize: 45),
                  textAlign: TextAlign.end,
                ),
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              ),
              Container(
                child: Text(
                  calculator.getActual(),
                  style: TextStyle(color: Color(0xff9B9B9B), fontSize: 45),
                  textAlign: TextAlign.end,
                ),
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              )
            ],
          ),
        )
      ],
    );
  }
}
