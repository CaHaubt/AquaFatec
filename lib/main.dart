import 'package:flutter/material.dart';
import 'package:aquafatec/register.dart';
import 'logo.dart';
import 'login.dart';
import 'home.dart';
import 'widge/colors.dart';
import 'profile.dart';

void main() {
  runApp(AquaFatecApp());
}

class AquaFatecApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'AquaFatec',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomeScreen(),
      routes: {
        // caminho dos botões de todas as telas
        '/login': (context) => LoginScreen(),
        '/cadastro': (context) => CadastroScreen(),
        '/menu': (context) => MenuScreen(),
        '/perfil': (context) => ProfileScreen(),
        //'/notificacao': context => NotificacaoScreen(),
      },
    );
  }
}

