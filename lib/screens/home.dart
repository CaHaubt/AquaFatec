import 'package:flutter/material.dart';
import '/widgets/navibar.dart';
import '/widgets/colors.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Color cor1 = Color.fromRGBO(178, 0, 0, 1.0);
    Color cor2 = Color.fromRGBO(39, 51, 54, 1.0);

    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        heightFactor: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Menu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: MyColors.cor3,
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
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Espaçamento vertical e horizontal
                  child: _buildMenuButton(context, 'assets/ph.png', 'pH', () {
                    // Ação quando o botão for clicado (PH)
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Espaçamento vertical e horizontal
                  child: _buildMenuButton(
                      context, 'assets/alimentador.png', 'Alimentador', () {
                    // Ação quando o botão for clicado (alimentador)
                  }),
                ),
              ],
            ),
            SizedBox(
                height: 16), // Espaçamento vertical entre as linhas de botões
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Espaçamento vertical e horizontal
                  child: _buildMenuButton(
                      context, 'assets/nivelAgua.png', 'Nível d´agua', () {
                    // Ação quando o botão for clicado (nivelAgua)
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Espaçamento vertical e horizontal
                  child: _buildMenuButton(
                      context, 'assets/oxigenio.png', 'Oxigênio', () {
                    // Ação quando o botão for clicado (oxigenio)
                  }),
                ),
              ],
            ),
            SizedBox(
                height: 16), // Espaçamento vertical entre as linhas de botões
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Espaçamento vertical e horizontal
                  child: _buildMenuButton(
                      context, 'assets/temperatura.png', 'Temperatura', () {
                    // Ação quando o botão for clicado (temperatura)
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Espaçamento vertical e horizontal
                  child: _buildMenuButton(
                      context, 'assets/turbidez.png', 'Turbidez', () {
                    // Ação quando o botão for clicado (turbidez)
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (menu) {
          setState(() {
            _currentIndex = menu;
          });
          // Implemente a lógica de navegação aqui
          // Pode usar um Navigator.push para navegar para diferentes telas
          // com base no índice selecionado.
          if (menu == 1) {
            // Navegar para a tela de Módulo
            Navigator.pushNamed(context, '/modulo');
          } else if (menu == 2) {
            // Navegar para a tela de Notificação
            Navigator.pushNamed(context, '/notificacao');
          } else if (menu == 3) {
            // Navegar para a tela de Perfil
            Navigator.pushNamed(context, '/perfil');
          }
        },
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String imageAsset,
      String buttonText, VoidCallback onPressed) {
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
