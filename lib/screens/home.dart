import 'package:flutter/material.dart';
import '/widgets/navibar.dart';
import '/widgets/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                color: MyColors.color3,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Selecione o módulo que deseja acessar',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            _buildMenuRow(context, [
              MenuButton(
                imageAsset: 'assets/ph.png',
                buttonText: 'pH',
                onPressed: () {
                  // Ação quando o botão for clicado (PH)
                },
              ),
              MenuButton(
                imageAsset: 'assets/alimentador.png',
                buttonText: 'Alimentador',
                onPressed: () {
                  // Ação quando o botão for clicado (alimentador)
                },
              ),
            ]),
            const SizedBox(height: 16),
            _buildMenuRow(context, [
              MenuButton(
                imageAsset: 'assets/nivelAgua.png',
                buttonText: 'Nível d´agua',
                onPressed: () {
                  // Ação quando o botão for clicado (nivelAgua)
                },
              ),
              MenuButton(
                imageAsset: 'assets/oxigenio.png',
                buttonText: 'Oxigênio',
                onPressed: () {
                  // Ação quando o botão for clicado (oxigenio)
                },
              ),
            ]),
            const SizedBox(height: 16),
            _buildMenuRow(context, [
              MenuButton(
                imageAsset: 'assets/temperatura.png',
                buttonText: 'Temperatura',
                onPressed: () {
                  // Ação quando o botão for clicado (temperatura)
                },
              ),
              MenuButton(
                imageAsset: 'assets/turbidez.png',
                buttonText: 'Turbidez',
                onPressed: () {
                  // Ação quando o botão for clicado (turbidez)
                },
              ),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (menu) {
          setState(() {
            _currentIndex = menu;
          });
          if (menu == 0) {
            // Navegar para a tela inicial (welcome)
            Navigator.pushNamed(context, '/welcome');
          } else if (menu == 1) {
            // Navegar para a tela de login
            Navigator.pushNamed(context, '/login');
          } else if (menu == 2) {
            // Navegar para a tela de registro (register)
            Navigator.pushNamed(context, '/register');
          } else if (menu == 3) {
            // Navegar para a tela de perfil
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }

  Widget _buildMenuRow(BuildContext context, List<MenuButton> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttons.map((button) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: button,
      )).toList(),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String imageAsset;
  final String buttonText;
  final VoidCallback onPressed;

  const MenuButton({
    required this.imageAsset,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Image.asset(
            imageAsset,
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 5),
          Text(buttonText),
        ],
      ),
    );
  }
}
