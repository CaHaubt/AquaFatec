import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Menu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Selecione o módulo que deseja acessar',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMenuButton(context, 'assets/ph.png', 'pH', () {
                  // Ação quando o botão for clicado (PH)
                }),
                _buildMenuButton(
                    context, 'assets/alimentador.png', 'Alimentador', () {
                  // Ação quando o botão for clicado (alimentador)
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMenuButton(context, 'assets/nivelAgua.png', 'Nível d´agua', () {
                  // Ação quando o botão for clicado (nivelAgua)
                }),
                _buildMenuButton(context, 'assets/oxigenio.png', 'Oxigênio', () {
                  // Ação quando o botão for clicado (oxigenio)
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMenuButton(context, 'assets/temperatura.png', 'Temperatura', () {
                  // Ação quando o botão for clicado (temperatura)
                }),
                _buildMenuButton(context, 'assets/turbidez.png', 'Turbidez', () {
                  // Ação quando o botão for clicado (turbidez)
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String imageAsset, String buttonText, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Image.asset(
            imageAsset,
            width: 100,
            height: 100,
          ),
          SizedBox(height: 5),
          Text(buttonText),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MenuScreen(),
  ));
}
