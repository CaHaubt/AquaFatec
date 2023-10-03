import 'package:flutter/material.dart';
import 'dart:math';
import '/widgets/navibar.dart';
import '/widgets/appbar.dart';
import '/widgets/colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _currentIndex = 2;

  late final List<Map<String, dynamic>> notifications;

  final Map<String, Map<String, dynamic>> moduleData = {
    'pH da água': {
      'imageAsset': 'assets/ph.png',
      'options': [
        'Leitura realizada, valor dentro do ideal',
      ],
    },
    'Alimentador': {
      'imageAsset': 'assets/alimentador.png',
      'options': [
        'Os peixes foram alimentados',
      ],
    },
    'Nível d\'água': {
      'imageAsset': 'assets/nivelAgua.png',
      'options': [
        'Leitura realizada, valor dentro do ideal',
      ],
    },
    'Oxigênio': {
      'imageAsset': 'assets/oxigenio.png',
      'options': [
        'Leitura realizada, valor dentro do ideal',
      ],
    },
    'Turbidez': {
      'imageAsset': 'assets/turbidez.png',
      'options': [
        'Leitura realizada, valor dentro do ideal',
        'Valores altos detectados, sistema de esterilização acionado',
      ],
    },
    'Temperatura': {
      'imageAsset': 'assets/temperatura.png',
      'options': [
        'Leitura realizada, valor dentro do ideal',
        'Valores baixos detectados, sistema de aquecimento acionado',
      ],
    },
  };

  @override
  void initState() {
    super.initState();
    notifications = List.generate(
      10,
      (index) {
        final randomModuleName =
            moduleData.keys.elementAt(Random().nextInt(moduleData.length));
        final moduleInfo = moduleData[randomModuleName]!;
        final options = moduleInfo['options'] as List<String>;
        final randomOptionIndex = Random().nextInt(options.length);
        final randomOption = options[randomOptionIndex];
        return {
          'moduleName': randomModuleName,
          'timeAgo': 'Há ${index + 1} hr',
          'description': randomOption,
          'imageAsset': moduleInfo['imageAsset'] as String,
        };
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.color4,
      appBar: CustomAppBar(
        title: 'Notificações',
        subtitle: 'Saiba tudo o que aconteceu nas últimas horas.',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return _buildNotificationItem(
              moduleName: notification['moduleName'] as String,
              timeAgo: notification['timeAgo'] as String,
              description: notification['description'] as String,
              imageAsset: notification['imageAsset'] as String,
            );
          },
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
          } else if (menu == 3) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }

  Widget _buildNotificationItem({
    required String moduleName,
    required String timeAgo,
    required String description,
    required String imageAsset,
  }) {
    Color moduleNameColor = MyColors.color3; // Cor padrão para o nome do módulo
    Color iconColor = MyColors.color3; // Cor padrão para o ícone do módulo

    // Verificar se a descrição contém palavras-chave e, se sim, alterar as cores
    if (description.toLowerCase().contains("valores altos") ||
        description.toLowerCase().contains("valores baixos")) {
      moduleNameColor =
          MyColors.color2; // Cor para o nome do módulo se houver palavras-chave
      iconColor = MyColors
          .color2; // Cor para o ícone do módulo se houver palavras-chave
    }

    return Container(
      margin: const EdgeInsets.only(left: 2, bottom: 16, right: 15),
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
      constraints: BoxConstraints(
        minHeight: 42,
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image.asset(
            imageAsset,
            width: 24,
            height: 24,
            color: iconColor, // Usar a cor para o ícone do módulo
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      moduleName,
                      style: TextStyle(
                        color: moduleNameColor,
                        // Usar a cor para o nome do módulo
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      timeAgo,
                      style: TextStyle(
                        color: MyColors.color1,
                      ),
                    ),
                  ],
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: MyColors.color1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
