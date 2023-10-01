import 'package:flutter/material.dart';
import '/widgets/navibar.dart';
import '/widgets/appbar.dart';
import '/widgets/colors.dart';

class ModuleScreen extends StatelessWidget {
  final String moduleName;

  ModuleScreen({required this.moduleName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.color4,
      appBar: CustomAppBar(
        title: 'Dashboard - pH',
        subtitle: 'Confira detalhes do seu sensor',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/grafico.png',
              width: 120,
              height: 120,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 10),
            _buildInfoBox('Última leitura: - currentdate 19:00:00'),
            _buildInfoBox('Valor da leitura: 7,8'),
            _buildInfoBox('Status do sensor: ATIVO'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (menu) {
          // Implemente a navegação de acordo com as suas rotas
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

  Widget _buildInfoBox(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: MyColors.containerButton,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: MyColors.color2,
        ),
      ),
    );
  }
}
