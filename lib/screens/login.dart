import 'package:flutter/material.dart';
import '/widgets/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0),
              Image.asset(
                'assets/logo.png',
                width: 120,
                height: 120,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 12.0),
              Text(
                'Sistema de gerenciamento de Aquaponia!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: MyColors.color3,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                'Efetue o login para prosseguir:',
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
                controller: passwordController,
                obscureText: !showPassword,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off,
                      color: MyColors.color1,
                    ),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
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
                  Navigator.pushNamed(context, '/home');
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
                  color: MyColors.color1,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              OutlinedButton(
                onPressed: () {
                  // Ação para "Login com o Google"
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: MyColors.color2,
                  shape: RoundedRectangleBorder(
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
                  foregroundColor: MyColors.color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text('Login com o Facebook'),
              ),
              const SizedBox(height: 32.0),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
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