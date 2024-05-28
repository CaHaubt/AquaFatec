import 'package:flutter/material.dart';
import '/widgets/appBar.dart';
import '/widgets/colors.dart';
import '/widgets/navibar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.color4,
      appBar: CustomAppBar(
        title: 'Sobre & Aviso Legal',
        subtitle: 'Informações adicionais de privacidade',
        showBackButton: true,
        onBackButtonPressed: () {
          Navigator.pushNamed(context, '/profile');
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Versão',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MyColors.color3,
              ),
            ),
            const Text(
              '1.0.1.3',
              style: TextStyle(
                fontSize: 16,
                color: MyColors.color3,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Software AquaFatec para Android. Todos os direitos reservados. AquaFatec e o'
                  ' logotipo da AquaFatec são marcas registradas da AquaFatec.com ou suas afiliadas.',
              style: TextStyle(
                fontSize: 16,
                color: MyColors.color1,
              ),
            ),
            const SizedBox(height: 16.0),
            _buildProfileOption(
              text: 'Termos & Condições',

              icon: Icons.arrow_forward,
              onTap: () {
                Navigator.pushNamed(context, '/terms_and_conditions');
              },
            ),
            const SizedBox(height: 16.0),
            _buildProfileOption(
              text: 'Avisos de Terceiros',
              icon: Icons.arrow_forward,
              onTap: () {
                Navigator.pushNamed(context, '/third_party_notices');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3,
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
              offset: const Offset(0, 2),
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
                color: MyColors.color3,
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
