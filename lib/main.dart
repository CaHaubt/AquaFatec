import 'package:flutter/material.dart';
import 'package:aquafatec/cadastro.dart';
import 'home.dart';
import 'login.dart';
import 'menuInicial.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        // caminho dos botões de todas as telas
        '/login': (context) => LoginScreen(),
        '/cadastro': (context) => CadastroScreen(),
        '/menu': (context) => MenuScreen(),

      },
    );
  }
}
