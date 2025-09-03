import 'package:flutter/material.dart';
import '../components/menu_component.dart';

class BemvindoScreen extends StatelessWidget {
  const BemvindoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo'),
      ),
      drawer: const MenuComponent(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '../assets/images/messi.jpg',
              width: 150,
            ),
            const SizedBox(height: 24),
            const Text(
              'Bem-vindo ao App, este é o trabalho!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

