import 'package:calculator/model/Calculator.dart';
import 'package:calculator/view/Display.dart';
import 'package:calculator/view/KeyBoard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff080D3C),
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final calculator = Calculator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 25,
                child: Container(
                    color: Color(0xff080D3C),
                    child: Display(calculator)
                ),
              ),
              Expanded(
                flex: 75,
                child: KeyBoard((){
                  setState(() {

                  });
                }, calculator),
              )
            ],
          ),
        ));
  }
}
