import 'package:flutter/material.dart';
import '/screens/register.dart';
import '/widgets/colors.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo de Volta!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: MyColors.color3,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Estamos felizes em tê-lo de volta. Você pode prosseguir de onde parou efetuando o login.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: MyColors.color2,
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Endereço de E-mail'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Ação para "Esqueceu sua senha?"
                },
                style: TextButton.styleFrom(
                  foregroundColor: MyColors.color2,
                ),
                child: const Text('Esqueceu sua senha?'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home'); // Alterado para '/home'
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.color3,
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 16.0),
              Text(
                'ou',
                style: TextStyle(
                  fontSize: 16.0,
                  color: MyColors.color2,
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Ação para "Login com o Google"
                },
                child: const Text('Login com o Google'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Ação para "Login com o Facebook"
                },
                child: const Text('Login com o Facebook'),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register'); // Alterado para '/register'
                },
                style: TextButton.styleFrom(
                  foregroundColor: MyColors.color1,
                ),
                child: const Text('Não tem uma conta? Se inscreva.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
