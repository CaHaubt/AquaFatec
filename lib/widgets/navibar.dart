import '/widgets/colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (menu) {
        if (menu == 0) {
          // Se o índice for 0 (home), navegue para a tela de home
          Navigator.pushNamed(context, '/home');
        } else if (menu == 1) {
          // Se o índice for 1 (modulo), navegue para a tela de modulo
          Navigator.pushNamed(context, '/module');
        } else if (menu == 2) {
          // Se o índice for 2 (notificacao), navegue para a tela de notificacao
          Navigator.pushNamed(context, '/notifications');
        } else if (menu == 3) {
          // Se o índice for 3 (perfil), navegue para a tela de perfil
          Navigator.pushNamed(context, '/profile');
        } else {
          // Caso contrário, chame a função de retorno onTap
          onTap(menu);
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_outlined),
          label: 'Painel',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: 'Notificações',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Perfil',
        ),
      ],
      unselectedItemColor: MyColors.color1,
      selectedItemColor: MyColors.color3,
    );
  }
}
