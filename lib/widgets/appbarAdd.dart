import 'package:flutter/material.dart';
import '/widgets/colors.dart';


class CustomAppBarAdd extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final bool showBackButton;
  final VoidCallback? onBackButtonPressed;

  const CustomAppBarAdd({super.key, 
    required this.title,
    this.subtitle,
    this.showBackButton = false,
    this.onBackButtonPressed,


  });

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(top: 30.0, left: 8.0, bottom: 0.0),
        color: MyColors.color4,
        child: ClipRect(
          // Aplicar um ClipRect ao redor do conteúdo
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: MyColors.color3,
                    ),
                    onPressed: onBackButtonPressed ??
                            () {}, // Chame a função quando o botão de voltar for pressionado, ou use uma função vazia se onBackButtonPressed for nulo
                  ),
                ],
              ),

              if (showBackButton) // Adicione o botão de voltar apenas se showBackButton for true
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(width: 8),
                    // Espaçamento entre o botão de voltar e o título
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: MyColors.color3,
                          ),
                        ),
                        if (subtitle != null)
                          Text(
                            subtitle!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: MyColors.color1,
                            ),
                          ),
                      ],
                    ),
                    if (!showBackButton) // Se o botão de voltar não estiver visível, exiba apenas o título e o subtítulo
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: MyColors.color3,
                            ),
                          ),
                          if (subtitle != null)
                            Text(
                              subtitle!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: MyColors.color1,
                              ),
                            ),
                        ],
                      ),
                  ],
                ),


              Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:[
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.40,
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                      },
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}