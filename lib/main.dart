import 'package:flutter/material.dart';
import '/screens/register.dart';
import '/screens/logo.dart';
import '/screens/login.dart';
import '/screens/home.dart';
import '/screens/profile.dart';
import '/screens/welcome.dart';

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
      initialRoute: '/logo',
      routes: {
        '/logo': (context) => const LogoScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => CadastroScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
