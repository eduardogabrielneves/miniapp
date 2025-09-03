import 'package:flutter/material.dart';
import 'package:mini_app_flutter/screens/bemvindo_screen.dart';
import 'package:mini_app_flutter/screens/calculadora_screen.dart';
import 'package:mini_app_flutter/screens/my_home_page.dart';
import 'package:mini_app_flutter/screens/sobre_screen.dart';
import 'package:mini_app_flutter/screens/sorteador_screen.dart';

class MenuComponent extends StatelessWidget {
  const MenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border(bottom: BorderSide(color: Colors.black, width: 4.0)),
            ),
            child: Center(
              child: Text(
                'Meu Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BemvindoScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.casino),
            title: const Text('Sorteador de Número'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const SorteadorScreen(title: 'Sorteador de Número')));
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Calculadora'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CalculadoraScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Sobre'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SobreScreen()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyHomePage(title: 'Login')));
            },
          ),
        ],
      ),
    );
  }
}

