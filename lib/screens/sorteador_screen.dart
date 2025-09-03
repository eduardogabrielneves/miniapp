import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/menu_component.dart';

class SorteadorScreen extends StatefulWidget {
  final String title;
  const SorteadorScreen({super.key, required this.title});

  @override
  _SorteadorScreenState createState() => _SorteadorScreenState();
}

class _SorteadorScreenState extends State<SorteadorScreen> {
  final TextEditingController _minController = TextEditingController(text: '1');
  final TextEditingController _maxController = TextEditingController(text: '100');
  String _resultado = '?';

  void _sortear() {
    final int? min = int.tryParse(_minController.text);
    final int? max = int.tryParse(_maxController.text);

    if (min != null && max != null && min <= max) {
      final random = Random();
      final numeroSorteado = min + random.nextInt(max - min + 1);
      setState(() {
        _resultado = numeroSorteado.toString();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Por favor, insira um intervalo de números válido.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // O título agora é dinâmico, vindo do parâmetro do widget.
        title: Text(widget.title),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      // O 'const' foi removido para resolver o segundo erro de compilação.
      drawer: MenuComponent(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Defina o intervalo para o sorteio',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _minController,
                      decoration: const InputDecoration(
                        labelText: 'Número Mínimo',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _maxController,
                      decoration: const InputDecoration(
                        labelText: 'Número Máximo',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'O número sorteado é:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              Text(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _sortear,
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                child: const Text('Sortear Agora'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

