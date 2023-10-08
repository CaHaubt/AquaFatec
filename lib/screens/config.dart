import 'package:flutter/material.dart';
import '/widgets/navibar.dart';
import '/widgets/appbar.dart';
import '/widgets/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 3;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.color4,
      appBar: CustomAppBar(
        title: 'Configurações',
        subtitle: 'Detalhes sobre sua conta e perfil.',
      ),
      // Usando o novo widget AppBarWidget
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Image.asset(
                    'assets/avatar.png',
                    width: 100, // Defina o tamanho desejado para a imagem
                    height: 100,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome do Usuário',
                      style: TextStyle(
                        fontSize: 20, // Tamanho da fonte reduzido em 2
                        fontWeight: FontWeight.bold,
                        color: MyColors.color3,
                      ),
                    ),
                    Text(
                      'email@exemplo.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColors.containerButton,
                boxShadow: [
                  // Adiciona sombra
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
                  const Text(
                    'Notificações',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: MyColors.dialogText,
                    ),
                  ),
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
            _buildProfileOption(
              text: 'Gerenciar Perfil', // Alterado o texto
              icon: Icons.arrow_forward,
              onTap: () {
                // Implemente a navegação para a tela de Gerenciar Perfil aqui
                Navigator.pushNamed(context, '/manage_profile');
              },
            ),
            const SizedBox(height: 16),
            Spacer(),
            // Espaço flexível para empurrar "Sair da Conta" para cima
            _buildProfileOption(
              text: 'Ajuda e Feedback', // Novo botão
              icon: Icons.help_outline,
              onTap: () {
                // Implemente a navegação para a tela de Suporte aqui
                Navigator.pushNamed(context, '/support');
              },
            ),
            SizedBox(height: 16),
            // Espaço entre "Ajuda e Feedback" e "Termos & Condições"
            _buildProfileOption(
              text: 'Sobre & Aviso legal',
              icon: Icons.arrow_forward,
              onTap: () {
                // Implemente a navegação para a tela de Termos & Condições aqui
                Navigator.pushNamed(context, '/about');
              },
            ),
            const SizedBox(height: 16),
            _buildProfileOption(
              text: 'Sair da Conta',
              icon: Icons.logout,
              onTap: () {
                _showLogoutConfirmationDialog(context);
              },
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
            Navigator.pushNamed(context, '/menu');
          } else if (menu == 1) {
            Navigator.pushNamed(context, '/module');
          } else if (menu == 2) {
            Navigator.pushNamed(context, '/notifications');
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
            // Adiciona sombra
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

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MyColors.dialogBackground,
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Tem certeza que deseja sair?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: MyColors.dialogText,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Ao sair da conta, você precisará fazer login novamente para acessar.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.color1,
                        fixedSize: Size(110, 20),
                      ),
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.color2,
                        fixedSize: Size(110, 20),
                      ),
                      child: const Text(
                        'Sair',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}