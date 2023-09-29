import 'package:flutter/material.dart';
import '/widgets/navibar.dart';
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
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: TextStyle(
            color: MyColors.color3,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome do Usuário',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: MyColors.color3,
                      ),
                    ),
                    Text(
                      'email@example.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColors.containerButton,
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
            const SizedBox(height: 24),
            _buildProfileOption(
              text: 'Alterar Senha',
              icon: Icons.arrow_forward,
              onTap: () {
                // Implemente a navegação para a tela de Alterar Senha aqui
                Navigator.pushNamed(context, '/alterar_senha');
              },
            ),
            const SizedBox(height: 16),
            _buildProfileOption(
              text: 'Alterar Perfil',
              icon: Icons.arrow_forward,
              onTap: () {
                // Implemente a navegação para a tela de Alterar Perfil aqui
                Navigator.pushNamed(context, '/alterar_perfil');
              },
            ),
            const SizedBox(height: 16),
            _buildProfileOption(
              text: 'Termos & Condições',
              icon: Icons.arrow_forward,
              onTap: () {
                // Implemente a navegação para a tela de Termos & Condições aqui
                Navigator.pushNamed(context, '/termos_condicoes');
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
            Navigator.pushNamed(context, '/modulo');
          } else if (menu == 2) {
            Navigator.pushNamed(context, '/notificacao');
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
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: MyColors.dialogBackground,
            ),
            padding: const EdgeInsets.all(16),
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
                const SizedBox(height: 16),
                const Text(
                  'Ao sair da conta, você precisará fazer login novamente para acessar.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.cancelButton,
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
                        backgroundColor: MyColors.confirmButton,
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
