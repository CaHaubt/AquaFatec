import 'package:flutter/material.dart';
import '/widgets/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'AquaFatec',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: MyColors.color3,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/mao.png',
                fit: BoxFit.fill,
              ),
              SizedBox(height: 20),
              Text(
                'Monitoramento da aquaponia na palma de sua mão',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: MyColors.color2,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.color3,
                ),
                child: Text('Começar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
