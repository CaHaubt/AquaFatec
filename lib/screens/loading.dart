import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'welcome.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // nao deixa virar
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20.0),
              // Espaço entre a imagem e a animação
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.blue), // Cor da animação
              ),
            ],
          ),
        ),
      ),
    );
  }
}