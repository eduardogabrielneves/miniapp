import 'package:flutter/material.dart';
import '../components/menu_component.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CalculadoraScreen(),
    );
  }
}

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  _CalculadoraScreenState createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  String output = "0";
  String _currentInput = "";
  String _operator = "";
  double _num1 = 0.0;

  void buttonPressed(String buttonText) {
    setState(() {
      if ("0123456789.".contains(buttonText)) {
        if (_currentInput.contains('.') && buttonText == '.') return;
        _currentInput += buttonText;
        output = _currentInput;
      } else if (['+', '-', '×', '÷'].contains(buttonText)) {
        if (_currentInput.isEmpty) return;
        _num1 = double.parse(_currentInput);
        _operator = buttonText;
        _currentInput = "";
      } else if (buttonText == 'C') {
        _currentInput = "";
        output = "0";
        _num1 = 0.0;
        _operator = "";
      } else if (buttonText == '=') {
        if (_currentInput.isEmpty || _operator.isEmpty) return;

        double num2 = double.parse(_currentInput);
        double result = 0.0;

        if (_operator == '+') result = _num1 + num2;
        if (_operator == '-') result = _num1 - num2;
        if (_operator == '×') result = _num1 * num2;
        if (_operator == '÷') {
          if (num2 == 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Essa operação é inválida!')),
            );
            _currentInput = "";
            _num1 = 0.0;
            _operator = "";
            return;
          }
          result = _num1 / num2;
        }

        output = result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 2);
        _currentInput = output;
        _operator = "";
      }
    });
  }

  Widget buildButton(String buttonText, {Color? color, Color textColor = Colors.white, ShapeBorder shape = const CircleBorder()}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[800],
            padding: const EdgeInsets.all(24.0),
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuComponent(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculadora Simples'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Text(
                output,
                style: const TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Divider(height: 1, color: Colors.grey),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("÷", color: Colors.orange),
              ]),
              Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("×", color: Colors.orange),
              ]),
              Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-", color: Colors.orange),
              ]),
              Row(children: [
                buildButton("C", color: Colors.grey[600]),
                buildButton("0"),
                buildButton("."),
                buildButton("+", color: Colors.orange),
              ]),
              Row(children: [
                buildButton("=", color: Colors.orange, shape: const StadiumBorder()),
              ]),
            ]),
          ),
        ],
      ),
    );
  }
}

