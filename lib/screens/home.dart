import 'package:flutter/material.dart';
import '/widgets/navibar.dart';
import '/widgets/colors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // pega o tamanho da tela (altura)
    double deviceHeight = MediaQuery.of(context).size.height;
    // tamanho do botao com base na altura da tela
    double childrenAspectRatioBasedOnScreenHeight = deviceHeight > 720 ? 1 : 1.1;
    // tamanho da imagem com base na altura da tela
    double childrenAssetSizeBasedOnScreenHeight= deviceHeight > 720 ? 80 : 48;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
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
            const SizedBox(height: 16),
            Expanded(
              flex: 3,
              child: GridView.count(
                padding: const EdgeInsets.all(24.0),
                childAspectRatio: childrenAspectRatioBasedOnScreenHeight,
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  _buildMenuItem(
                    imageAsset: 'assets/ph.png',
                    buttonText: 'pH',
                    menuItemAssetSize: childrenAssetSizeBasedOnScreenHeight
                  ),
                  _buildMenuItem(
                    imageAsset: 'assets/alimentador.png',
                    buttonText: 'Alimentação',
                    menuItemAssetSize: childrenAssetSizeBasedOnScreenHeight
                  ),
                  _buildMenuItem(
                    imageAsset: 'assets/nivelAgua.png',
                    buttonText: 'Nível d\'água',
                    menuItemAssetSize: childrenAssetSizeBasedOnScreenHeight
                  ),
                  _buildMenuItem(
                    imageAsset: 'assets/oxigenio.png',
                    buttonText: 'Oxigênio',
                    menuItemAssetSize: childrenAssetSizeBasedOnScreenHeight
                  ),
                  _buildMenuItem(
                    imageAsset: 'assets/turbidez.png',
                    buttonText: 'Turbidez',
                    menuItemAssetSize: childrenAssetSizeBasedOnScreenHeight
                  ),
                  _buildMenuItem(
                    imageAsset: 'assets/temperatura.png',
                    buttonText: 'Temperatura',
                    menuItemAssetSize: childrenAssetSizeBasedOnScreenHeight
                  ),
                ],
              ),
            ),
          ]
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
            Navigator.pushNamed(context, '/module');
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
    required double menuItemAssetSize,
  }) {
    return InkWell(
      onTap: () {
        if (buttonText == 'pH') {
          Navigator.pushNamed(context, '/phPage');
        } else if (buttonText == 'Alimentação') {
          Navigator.pushNamed(context, '/alimentadorPage');
        } else if (buttonText == 'Nível d\'água') {
          Navigator.pushNamed(context, '/nivelAgua');
        } else if (buttonText == 'Oxigênio') {
          Navigator.pushNamed(context, '/oxigenio');
        } else if (buttonText == 'Turbidez') {
          Navigator.pushNamed(context, '/turbidezPage');
        } else if (buttonText == 'Temperatura') {
          Navigator.pushNamed(context, '/temperaturePage');
        }
      },
      child: Hero(
        tag: buttonText,
        child: InkResponse(
          onTap: () {
            if (buttonText == 'pH') {
              Navigator.pushNamed(context, '/phPage');
            } else if (buttonText == 'Alimentação') {
              Navigator.pushNamed(context, '/alimentadorPage');
            } else if (buttonText == 'Nível d\'água') {
              Navigator.pushNamed(context, '/nivelAgua');
            } else if (buttonText == 'Oxigênio') {
              Navigator.pushNamed(context, '/oxigenio');
            } else if (buttonText == 'Turbidez') {
              Navigator.pushNamed(context, '/turbidezPage');
            } else if (buttonText == 'Temperatura') {
              Navigator.pushNamed(context, '/temperaturePage');
            }
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
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imageAsset,
                  width: menuItemAssetSize,
                  height: menuItemAssetSize,
                ),
                const SizedBox(height: 10),
                Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MyColors.color3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
