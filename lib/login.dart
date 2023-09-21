import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'menuInicial.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color cor1 = Color.fromRGBO(178, 0, 0, 1.0);
    Color cor2 = Color.fromRGBO(39, 51, 54, 1.0);
    Color cor3 = Color.fromRGBO(0, 92, 109, 1.0);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo de Volta!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: cor1,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Estamos felizes em tê-lo de volta. Você pode prosseguir de onde parou efetuando o login.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: cor2,
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Endereço de E-mail'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Senha'),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Ação para "Esqueceu sua senha?"
                },
                style: TextButton.styleFrom(
                  primary: cor2,
                ),
                child: Text('Esqueceu sua senha?'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/menu');
                },
                style: ElevatedButton.styleFrom(
                  primary: cor3,
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 16.0),
              Text(
                'ou',
                style: TextStyle(
                  fontSize: 16.0,
                  color: cor2,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Ação para "Login com o Google"
                },
                child: Text('Login com o Google'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Ação para "Login com o Facebook"
                },
                child: Text('Login com o Facebook'),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastro');
                },
                style: TextButton.styleFrom(
                  primary: cor1,
                ),
                child: Text('Não tem uma conta? Se inscreva.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
