import 'package:flutter/material.dart';
import '/widgets/colors.dart';

class CadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Bem-vindo ao AquaFatec!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: MyColors.color3,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Olá! Acredito que seja novo(a) aqui. Você pode começar a usar assim que efetuar a inscrição.',
              style: TextStyle(
                fontSize: 16.0,
                color: MyColors.color2,
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Usuário'),
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
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirmar Senha'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Ação para o botão "Inscrever"
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.color3,
              ),
              child: Text('Inscrever'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
                // Ação botão "Voltar para o login"
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.color3,
              ),
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
