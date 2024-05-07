import 'package:aquafatec/screens/alimentadorPage.dart';
import "package:flutter/material.dart";
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
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AquaFatecApp());
}

class WidgetsFlutterBinding {
  static void ensureInitialized() {}
}

class AquaFatecApp extends StatelessWidget {
  const AquaFatecApp({super.key});

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
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const CadastroScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/about': (context) => const AboutScreen(),
        '/manage_profile': (context) => const ManageProfileScreen(),
        '/temperaturePage': (context) => const TemperatureScreen(),
        '/phPage': (context) => const PHScreen(),
        '/turbidezPage': (context) => const TurbidezScreen(),
        '/alimentadorPage': (context) => const AlimentadorScreen(),
      },
    );
  }
}