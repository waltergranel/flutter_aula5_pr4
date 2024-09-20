import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String visor = '';

  void _adicionarentrada(String entrada) {
    setState(() {
      if (entrada == 'CE') {
        visor = '';
      } else if (entrada == 'DEL') {
        visor =
            visor.isNotEmpty ? visor.substring(0, visor.length - 1) : '';
      } else if (entrada == '=') {
        //try {
        var resultado = _avaliarExpressao(visor);
        visor = resultado.toString();
        // } catch (e) {
        //    visor = 'Erro';
        //   }
      } else {
        visor += entrada;
      }
    });
  }

  double _avaliarExpressao(String expressao) {
    // Remove espaços
    final cleanedExpression = expressao.replaceAll(' ', '');

    // Adiciona um prefixo de "0" para lidar com expressões que começam com um operador
    final expressionWithPrefix = '0+$cleanedExpression';

    // Cria uma lista de operadores e números
    final operadores = RegExp(r'[+\-*/]');
    final numeros = expressionWithPrefix.split(operadores);

    // Cria uma lista de operadores encontrada na expressão
    final listaOperadores = operadores
        .allMatches(expressionWithPrefix)
        .map((m) => m.group(0))
        .toList();

    // Calcula a expressão com base nos operadores e números
    double resultado = double.parse(numeros[0]);

    for (int i = 0; i < listaOperadores.length; i++) {
      final operador = listaOperadores[i];
      final num2 = double.parse(numeros[i + 1]);

      switch (operador) {
        case '+':
          resultado += num2;
          break;
        case '-':
          resultado -= num2;
          break;
        case '*':
          resultado *= num2;
          break;
        case '/':
          resultado /= num2;
          break;
      }
    }
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Calculadora',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  autofocus: true,
                  enabled: false,
                  //focusNode: focoAltura,
                  decoration: InputDecoration(
                    /*enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),*/
                    border: const OutlineInputBorder(),
                    labelText: visor,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BtnVerde('7'),
                  BtnVerde('8'),
                  BtnVerde('9'),
                  BtnAzul('CE'),
                  BtnVermelho('DEL'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BtnVerde('4'),
                  BtnVerde('5'),
                  BtnVerde('6'),
                  BtnAzul('*'),
                  BtnAzul('/'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BtnVerde('1'),
                  BtnVerde('2'),
                  BtnVerde('3'),
                  BtnAzul('+'),
                  BtnAzul('-'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BtnVerde('0'),
                  BtnVerde(','),
                  BtnLaranja('='),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget BtnVerde(String entrada) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent, //background color of button
              side: BorderSide(
                  width: 3, color: Colors.brown), //border width and color
              elevation: 3, //elevation of button
              shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(15) //content padding inside button
              ),
          onPressed: () => _adicionarentrada(entrada),
          child: Text(entrada, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }

  Widget BtnVermelho(String entrada) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent, //background color of button
              side: BorderSide(
                  width: 3, color: Colors.brown), //border width and color
              elevation: 3, //elevation of button
              shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(15) //content padding inside button
              ),
          onPressed: () => _adicionarentrada(entrada),
          child: Text(entrada, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }

  Widget BtnAzul(String entrada) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent, //background color of button
              side: BorderSide(
                  width: 3, color: Colors.brown), //border width and color
              elevation: 3, //elevation of button
              shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(15) //content padding inside button
              ),
          onPressed: () => _adicionarentrada(entrada),
          child: Text(entrada, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }

  Widget BtnLaranja(String entrada) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(210),
              backgroundColor: Colors.orangeAccent, //background color of button
              side: BorderSide(
                  width: 3, color: Colors.brown), //border width and color
              elevation: 3, //elevation of button
              shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(20), //content padding inside button
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          onPressed: () => _adicionarentrada(entrada),
          child: Text(entrada, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
