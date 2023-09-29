import 'package:flutter/material.dart';
import '/widgets/colors.dart';

class CadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20.0), // Aumentei o espaçamento para dar mais espaço à UI
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Bem-vindo ao AquaFatec!',
              style: TextStyle(
                fontSize: 28.0, // Aumentei o tamanho da fonte
                fontWeight: FontWeight.bold,
                color: MyColors.color3,
              ),
              textAlign: TextAlign.center, // Centralizei o texto
            ),
            SizedBox(height: 24.0), // Aumentei o espaçamento entre os elementos
            Text(
              'Olá! Acredito que seja novo(a) aqui. Você pode começar a usar assim que efetuar a inscrição.',
              style: TextStyle(
                fontSize: 16.0, // Aumentei o tamanho da fonte
                color: MyColors.color2,
              ),
              textAlign: TextAlign.center, // Centralizei o texto
            ),
            SizedBox(height: 24.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Usuário',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Endereço de E-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirmar Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Ação para o botão "Inscrever"
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.color3, // Cor do botão
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text(
                'Inscrever',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
                // Ação botão "Voltar para o login"
              },
              style: TextButton.styleFrom(
                foregroundColor: MyColors.color3, padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text(
                'Voltar para o login',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
