import 'package:flutter/material.dart';
import 'package:flutter_aula5_pr4/calculadora.dart';

void main() {
  //runApp(const MainApp());

    runApp(const Calculadora());

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
