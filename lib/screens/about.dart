import 'package:flutter/material.dart';
import '/widgets/appbar.dart';
import '/widgets/colors.dart';
import '/widgets/navibar.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.color4,
      appBar: CustomAppBar(
        title: 'Sobre & Aviso Legal',
        subtitle: 'Informações adicionais de privacidade',
        showBackButton: true, // Exibe o botão de voltar apenas nesta tela
        onBackButtonPressed: () {
          Navigator.pushNamed(context, '/profile');
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Versão',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MyColors.color3,
              ),
            ),
            Text(
              '1.0.0.1',
              style: TextStyle(
                fontSize: 16,
                color: MyColors.color1,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Software AquaFatec para Android. Todos os direitos reservados. AquaFatec e o logotipo da AquaFatec são marcas registradas da AquaFatec.com ou suas afiliadas.',
              style: TextStyle(
                fontSize: 16,
                color: MyColors.color1,
              ),
            ),
            SizedBox(height: 16.0), // Espaço entre a descrição e os botões
            _buildProfileOption(
              text: 'Termos & Condições',
              icon: Icons.arrow_forward,
              onTap: () {
                // Implemente a navegação para a tela de Termos & Condições aqui
                Navigator.pushNamed(context, '/terms_and_conditions');
              },
            ),
            SizedBox(height: 16.0), // Espaço entre os botões
            _buildProfileOption(
              text: 'Avisos de Terceiros',
              icon: Icons.arrow_forward,
              onTap: () {
                // Implemente a navegação para a tela de Avisos de Terceiros aqui
                Navigator.pushNamed(context, '/third_party_notices');
              },
            ),
              ],
            ),
        ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3, // Defina o índice correto para esta tela
        onTap: (menu) {
          if (menu == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (menu == 1) {
            Navigator.pushNamed(context, '/modulo');
          } else if (menu == 2) {
            Navigator.pushNamed(context, '/notifications');
          } else if (menu == 3) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }

  Widget _buildProfileOption({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              icon,
              color: MyColors.color3,
            ),
          ],
        ),
      ),
    );
  }
}
