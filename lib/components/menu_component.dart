import 'package:flutter/material.dart';
import 'package:mini_app_flutter/screens/sobre_screen.dart';
import 'package:mini_app_flutter/screens/sorteador_screen.dart';
import '../screens/my_home_page.dart';

class MenuComponent extends StatelessWidget {
  const MenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Text(
              'Meu Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Navega para a tela de boas-vindas/home
              Navigator.pushReplacementNamed(context, '/bemvindo');
            },
          ),
          ListTile(
            leading: const Icon(Icons.casino),
            title: const Text('Sorteador de Número'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/sorteador');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Sobre'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/sobre');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              // Navega de volta para a tela de login
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}

