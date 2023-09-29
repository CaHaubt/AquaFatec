import 'package:flutter/material.dart';
import '/widgets/navibar.dart';
import '/widgets/colors.dart';
import '/widgets/appbar.dart';

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
      appBar: CustomAppBar(title: 'Menu inicial'), // Usar a CustomAppBar
      body: Padding(
        padding: const EdgeInsets.all(26.0), // Espaçamento geral
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Esticar os filhos horizontalmente
          children: [
            const Text(
              'Selecione o módulo que deseja acessar:',
              style: TextStyle(
                fontSize: 17, // Alterado para 18
                fontWeight: FontWeight.bold, // Negrito
                color: Colors.black,
              ),
              textAlign: TextAlign.center, // Centralizar o texto
            ),
            const SizedBox(height: 45), // Espaço maior entre o texto e os botões
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  _buildMenuItem(
                    imageAsset: 'assets/ph.png',
                    buttonText: 'pH',
                  ),
                  _buildMenuItem(
                    imageAsset: 'assets/alimentador.png',
                    buttonText: 'Alimentador',
                  ),
                  _buildMenuItem(
                    imageAsset: 'assets/nivelAgua.png',
                    buttonText: 'Nível d´agua',
                  ),
                  _buildMenuItem(
                    imageAsset: 'assets/oxigenio.png',
                    buttonText: 'Oxigênio',
                  ),
                  _buildMenuItem(
                    imageAsset: 'assets/temperatura.png',
                    buttonText: 'Temperatura',
                  ),
                  _buildMenuItem(
                    imageAsset: 'assets/turbidez.png',
                    buttonText: 'Turbidez',
                  ),
                ],
              ),
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

  Widget _buildMenuItem({
    required String imageAsset,
    required String buttonText,
  }) {
    return InkWell(
      onTap: () {
        // Ação quando o botão for clicado (se necessário)
      },
      child: InkResponse(
        onTap: () {
          // Ação quando o botão for clicado (se necessário)
        },
        child: Container(
          decoration: BoxDecoration(
            color: MyColors.containerButton,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: buttonText,
                child: Image.asset(
                  imageAsset,
                  width: 80,
                  height: 80,
                ),
              ),
              const SizedBox(height: 10), // Espaçamento entre a imagem e o texto
              Text(
                buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MyColors.color3, // Cor do texto
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
