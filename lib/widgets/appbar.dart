import 'package:flutter/material.dart';
import '/widgets/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;

  CustomAppBar({required this.title, this.subtitle});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(top: 30.0, left: 16.0),
        color: MyColors.color4,
        child: ClipRect( // Aplicar um ClipRect ao redor do conteúdo
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MyColors.color3,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: TextStyle(
                    fontSize: 16,
                    color: MyColors.color1,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
