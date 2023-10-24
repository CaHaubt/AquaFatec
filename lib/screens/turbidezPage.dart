import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import '../widgets/appbar.dart';
import '../widgets/colors.dart';
import '../widgets/navibar.dart';
import 'package:intl/intl.dart';
import 'package:aquafatec/screens/settings/mqtt_manager.dart';


class TurbidezScreen extends StatefulWidget {
  const TurbidezScreen({super.key});

  @override
  _TurbidezScreenState createState() => _TurbidezScreenState();
}

class _TurbidezScreenState extends State<TurbidezScreen> {
  MQTTManager mqttManager = MQTTManager();
  String turbidezValue = 'null';

  @override
  void initState() {
    super.initState();
    mqttManager.initialize();
    subscribeToTurbidezTopic();
  }

  void subscribeToTurbidezTopic() async {
    MqttServerClient mqttClient = mqttManager.getClient();

    mqttClient.subscribe('turbidez', MqttQos.atLeastOnce);

    mqttClient.updates?.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
      final String message =
      MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      setState(() {
        turbidezValue = message;
      });
    });
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
}

