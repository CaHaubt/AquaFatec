import 'package:flutter/material.dart';
import '/widgets/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Size get preferredSize => Size.fromHeight(80.0); // Ajuste a altura conforme necessário

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        alignment: Alignment.topLeft, // Alinhe o texto ao topo verticalmente
        padding: EdgeInsets.only(top: 30.0, left: 10.0, bottom: 30.0), // Ajuste o padding para alinhar verticalmente no topo e adicionar espaço abaixo do texto
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
