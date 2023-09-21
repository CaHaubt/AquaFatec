import 'package:flutter/material.dart';


class CadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color cor1 = Color.fromRGBO(178, 0, 0, 1.0);
    Color cor2 = Color.fromRGBO(39, 51, 54, 1.0);
    Color cor3 = Color.fromRGBO(0, 92, 109, 1.0);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Bem vindo ao Tecponia!',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: cor1,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Olá! Acredito que seja novo (a) aqui. Você pode começar a usar assim que efetuar a inscrição.',
              style: TextStyle(
                  fontSize: 16.0,
                  color: cor2,
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
                primary: cor3,
              ),
              child: Text('Inscrever'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
                // ação botão voltar login
              },
              style: ElevatedButton.styleFrom(
                primary: cor3,
              ),
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
