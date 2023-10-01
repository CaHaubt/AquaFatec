import 'package:flutter/material.dart';
import '/widgets/navibar.dart';
import '/widgets/colors.dart';
import '/screens/module.dart'; // Importe a tela do módulo

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
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 15.0),
            Image.asset(
              'assets/logo.png',
              width: 120,
              height: 120,
              alignment: Alignment.center,
            ),
            const Text(
              'Selecione o módulo que deseja acessar:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
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
                  // Outros botões de módulo aqui...
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
            Navigator.pushNamed(context, '/home');
          } else if (menu == 1) {
            Navigator.pushNamed(context, '/login');
          } else if (menu == 2) {
            Navigator.pushNamed(context, '/notifications');
          } else if (menu == 3) {
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
        _navigateToModule(context, buttonText);
      },
      child: InkResponse(
        onTap: () {
          _navigateToModule(context, buttonText);
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
              const SizedBox(height: 10),
              Text(
                buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MyColors.color3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToModule(BuildContext context, String buttonText) {
    // Navegue para a tela de módulo correspondente
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ModuleScreen(moduleName: buttonText),
      ),
    );
  }
}
