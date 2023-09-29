import 'package:flutter/material.dart';
import '/widgets/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(60.0); // Altura padrão da barra de aplicativos

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        alignment: Alignment.centerLeft, // Alinhe o texto à esquerda verticalmente
        padding: const EdgeInsets.only(top: 30.0,left: 16.0), // Ajuste o padding para alinhar verticalmente à esquerda
        color: MyColors.color4, // Cor de fundo definida como MyColors.color4
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: MyColors.color3, // Cor do texto definida como MyColors.color3
          ),
        ),
      ),
    );
  }
}
