import '/widgets/colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (menu) {
        if (menu == 0){
          // Se o índice for 0 (modulo), navegue para a tela de modulo
          Navigator.pushNamed(context, '/menu');
        }
        else if(menu == 1) {
          // Se o índice for 0 (modulo), navegue para a tela de modulo
          Navigator.pushNamed(context, '/modulo');
        }
        else if (menu == 2) {
          // Se o índice for 1 (notificação), navegue para a tela de notificações
          Navigator.pushNamed(context, '/notificacao');
        } else if (menu == 3) {
          // Se o índice for 2 (perfil), navegue para a tela de perfil
          Navigator.pushNamed(context, '/perfil');
        }
        else {
          // Caso contrário, chame a função de retorno onTap
          widget.onTap(menu);
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_outlined),
          label: 'Modulo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: 'Notificação',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Perfil',
        ),
      ],
      unselectedItemColor: MyColors.cor1,
      selectedItemColor: MyColors.cor3,
    );
  }
}
