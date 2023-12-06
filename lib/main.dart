import 'package:aquafatec/screens/alimentadorPage.dart';
import 'package:flutter/material.dart';
import '/screens/loading.dart';
import '/screens/login.dart';
import '/screens/home.dart';
import '/screens/config.dart';
import '/screens/welcome.dart';
import '/screens/about.dart';
import '/screens/register.dart';
import '/screens/notifications.dart';
import '/screens/settings/manage_profile.dart';
import '/screens/phPage.dart';
import '/screens/temperaturePage.dart';
import '/screens/turbidezPage.dart';


void main() async {
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
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => const LoadingScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => CadastroScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/notifications': (context) => NotificationsScreen(),
        '/about': (context) => AboutScreen(),
        '/manage_profile': (context) => ManageProfileScreen(),
        '/temperaturePage': (context) => TemperatureScreen(),
        '/phPage': (context) => PHScreen(),
        '/turbidezPage': (context) => TurbidezScreen(),
        '/alimentadorPage': (context) => AlimentadorScreen(),
      },
    );
  }
}