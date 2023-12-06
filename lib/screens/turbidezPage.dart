import 'package:aquafatec/screens/settings/mqtt_manager.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import '../widgets/appBar.dart';
import '../widgets/colors.dart';
import '../widgets/navibar.dart';
import 'package:intl/intl.dart';


class TurbidezScreen extends StatefulWidget {
  const TurbidezScreen({Key? key}) : super(key: key);

  @override
  State<TurbidezScreen> createState() => _TurbidezScreenState();
}

class _TurbidezScreenState extends State<TurbidezScreen> {
  MQTTClientManager mqttClientManager = MQTTClientManager();
  final String pubTopic = "aquafatec/tanque1/turbidez";
  String turbidezValue = 'null';

  @override
  void initState() {
    setupMqttClient();
    setupUpdatesListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now());

    return Scaffold(
      backgroundColor: MyColors.color4,
      appBar: CustomAppBar(
        title: 'Turbidez',
        subtitle: 'Confira detalhes do seu dispositivo',
        showBackButton: true, // Exibe o botão de voltar apenas nesta tela
        onBackButtonPressed: () {
          Navigator.pushNamed(context, '/home');
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'turbidez_image',
              child: Image.asset(
                'assets/turbidez_mensal.png',
                width: double.infinity,
                height: 250,
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(height: 10),
            _buildInfoBox('Última leitura:', formattedDate, fontSize: 16),
            _buildInfoBox('Valor da leitura:', turbidezValue, fontSize: 16),
            _buildInfoBox('Status do sensor:', 'ATIVO', fontSize: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (menu) {
          if (menu == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (menu == 1) {
            Navigator.pushNamed(context, '/module');
          } else if (menu == 2) {
            Navigator.pushNamed(context, '/notifications');
          } else if (menu == 3) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }
  Widget _buildInfoBox(String label, String value, {double fontSize = 16}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: MyColors.containerButton,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: MyColors.color3,
            ),
          ),
        ],
      ),
    );
  }
  Future<void> setupMqttClient() async{
    await mqttClientManager.connect();
    mqttClientManager.subscribe(pubTopic);
  }

  void setupUpdatesListener(){
    mqttClientManager
        .getMessagesStream()!
        .listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
      MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      setState(() {
        turbidezValue = pt;
      });
      //print('MQTTClient::Message received on topic: <${c[0].topic}> is $pt\n ');
    });
  }

}

