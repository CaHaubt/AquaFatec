import 'package:flutter/material.dart';
import '/widgets/colors.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Envolve o Column com SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0), // Reduzindo o espaçamento aqui
              Image.asset(
                'assets/logo.png',
                width: 120,
                height: 120,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 12.0),
              Text(
                'Estamos felizes em tê-lo de volta!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: MyColors.color3,
                ),
              ),
              Text(
                'Você pode prosseguir de onde parou efetuando o login.',
                style: TextStyle(
                  fontSize: 14.0,
                  color: MyColors.color1,
                ),
              ),
              const SizedBox(height: 32.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Endereço de E-mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
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
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home'); // Alterado para '/home'
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.color3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'ou',
                style: TextStyle(
                  fontSize: 16.0,
                  color: MyColors.color2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              OutlinedButton(
                onPressed: () {
                  // Ação para "Login com o Google"
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: MyColors.color2, shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text('Login com o Google'),
              ),
              const SizedBox(height: 16.0),
              OutlinedButton(
                onPressed: () {
                  // Ação para "Login com o Facebook"
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: MyColors.color2, shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text('Login com o Facebook'),
              ),
              const SizedBox(height: 32.0),
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