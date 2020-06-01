import 'dart:math';
import "package:intl/intl.dart";

class Calculator {

  double _result = 0;
  String _op = '+';
  String _actual = "0";

  onNumberPressed(int number){
    _actual += "$number";
  }
  
  onRemoveLast(){
    if(_actual.length>1)_actual = _actual.substring(0,_actual.length - 1);
    else _actual = "0";
  }

  onRemoveAll(){
    _actual = "0";
    _op = "+";
    _result = 0;
  }

  onDotPressed(){
    if(!_actual.contains("."))
      _actual += ".";
  }

  onOperatorPressed(Operator operator){
    final actual = double.parse(_actual);
    if(operator == Operator.PERCENTAGE)
      _actual = "${actual/100}";
    else if(operator == Operator.POW_TWO)
      _actual = "${pow(actual,2)}";
    else if(operator == Operator.SIGN)
      _actual = "${-actual}";
    else if(operator == Operator.INVERT && actual!=0)
      _actual = "${1/actual}";
    else if(actual > 0)
      _actual = "${sqrt(actual)}";
  }

  onOperationPressed(String operation){
    _op = operation;
  }

  onEquals(){
    final actual = double.parse(_actual);
    if(_op == "+") _result += actual;
    if(_op == "-") _result -= actual;
    if(_op == "×") _result *= actual;
    if(_op == "÷" && actual!= 0) _result /= actual;
    _actual = "0";
  }

  String getActual() {
    final actual = double.parse(_actual);
    if(_actual.length > 12){
      _actual = _formatQuantity(double.parse(_actual));
      return _actual;
    }
    else if(actual > 1 && _actual.startsWith("0")) return _actual.substring(1);
    else if(actual >= 0 && _actual.length > 1 && _actual[1] == '0') {
      _actual = '0';
      return _actual;
    }
    else return _actual;
  }
  String getOperator() => _op;
  String getResult() => _formatQuantity(_result);
  

  String _formatQuantity(double v) {
    if (v == null) return '';

    NumberFormat formatter = NumberFormat();
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = 8;
    return formatter.format(v);
  }

}

enum Operator {
  SQUARE_ROOT,
  POW_TWO,
  PERCENTAGE,
  INVERT,
  SIGN
}