import 'package:flutter/material.dart';
import 'package:aquafatec/main.dart';
import 'login.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Color cor1 = Color.fromRGBO(178, 0, 0, 1.0);
    Color cor2 = Color.fromRGBO(39, 51, 54, 1.0);
    Color cor3 = Color.fromRGBO(0, 92, 109, 1.0);

    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'AquaFatec',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: cor3,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/mao.png',
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 20),
                Text(
                  'Monitoramento da aquaponia na palma de sua mão',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: cor2,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: cor3,
                  ),
                  child: Text('Começar'),
                ),
              ],
            ),
          ),
        )
    );
  }
}