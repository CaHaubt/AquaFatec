import 'package:aquafatec/widgets/colors.dart';
import 'package:flutter/material.dart';

class ExclamationBox extends StatelessWidget {
  final String label;
  final String value;
  final double fontSize; // Tamanho da fonte do título
  final String additionalText;

  ExclamationBox({
    required this.label,
    required this.value,
    this.fontSize = 16.0,
    this.additionalText = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: MyColors.containerButton, // Cor de fundo personalizada
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: MyColors.color3, // Cor do texto personalizada
            ),
          ),
          GestureDetector(
            onTap: () {
              _showDetails(context);
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.info, // Ícone "i" para informações
                  color: MyColors.color1, // Cor do ícone "i"
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: fontSize, // Tamanho da fonte do valor
                fontWeight: FontWeight.bold,
                color: MyColors.color3, // Cor do texto personalizada
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  void _showDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "O que significa?",
            style: TextStyle(
              fontSize: fontSize - 1, // Reduz a fonte do título
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            additionalText,
            style: TextStyle(fontSize: fontSize - 4),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Fechar"),
            ),
          ],
        );
      },
    );
  }
}