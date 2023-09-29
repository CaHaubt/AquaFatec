import 'package:flutter/material.dart';
import '/widgets/navibar.dart';
import '/widgets/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 3;
  bool notificationsEnabled = true; // Variável para controlar o estado do toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.color4,
      appBar: AppBar(
        title: Text('Perfil',
        style: TextStyle(
          color: MyColors.color3,
        )
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: MyColors.color2,
                  child: const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome do Usuário',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'email@example.com',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColors.containerButton,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Notificações'),
                  Switch(
                    value: notificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        notificationsEnabled = value;
                      });
                      // Implemente a lógica para ativar/desativar notificações aqui
                    },
                    activeTrackColor: MyColors.color3,
                    inactiveTrackColor: MyColors.offToggle,
                    activeColor: MyColors.color4,
                    inactiveThumbColor: MyColors.color4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                // Implemente a navegação para a tela de Alterar Senha aqui
                Navigator.pushNamed(context, '/####');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: MyColors.containerButton,
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Alterar Senha'),
                    Icon(
                      Icons.arrow_forward,
                      color: MyColors.color3,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                // Implemente a navegação para a tela de Alterar Perfil aqui
                Navigator.pushNamed(context, '/alterar_perfil');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: MyColors.containerButton,
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Alterar Perfil'),
                    Icon(
                      Icons.arrow_forward,
                      color: MyColors.color3,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                // Implemente a navegação para a tela de Termos & Condições aqui
                Navigator.pushNamed(context, '/termos_condicoes');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: MyColors.containerButton,
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Termos & Condições'),
                    Icon(
                      Icons.arrow_forward,
                      color: MyColors.color3,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                // Implemente a lógica para sair da conta aqui
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: MyColors.containerButton,
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Sair da Conta'),
                    Icon(
                      Icons.logout,
                      color: MyColors.color3,
                    ),
                  ],
                ),
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
            // Navegar para a tela de menu
            Navigator.pushNamed(context, '/menu');
          } else if (menu == 1) {
            // Navegar para a tela de modulo
            Navigator.pushNamed(context, '/modulo');
          } else if (menu == 2) {
            // Navegar para a tela de Perfil
            Navigator.pushNamed(context, '/notificacao');
          }
        },
      ),
    );
  }
}