import 'package:flutter/material.dart';
import 'package:mini_app_flutter/screens/bemvindo_screen.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              TextFormField(
                controller: _usuarioController,
                decoration: InputDecoration(labelText: 'Usuario'),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.0),

              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a senha.';
                  }
                  return null;
                },
              ),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_usuarioController.text == 'admin' && _senhaController.text == '123') {
                      // Navega para a tela de boas-vindas
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BemvindoScreen()),
                      );
                    } else {
                      // Mostra erro de login
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Usuário ou senha incorretos')),
                      );
                    }
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
