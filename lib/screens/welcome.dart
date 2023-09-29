import 'package:flutter/material.dart';
import '/widgets/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/mao.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: 300, // Defina a altura desejada para a imagem
            ),
            const SizedBox(height: 40),
            Text(
              'Bem-vindo ao AquaFatec',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: MyColors.color3,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'O monitoramento da aquaponia na palma da sua mão.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: MyColors.color2,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.color3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              ),
              child: Text(
                'Começar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
