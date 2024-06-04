import 'package:aquafatec/screens/settings/mqtt_manager.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import '../widgets/appBar.dart';
import '../widgets/colors.dart';
import '../widgets/navibar.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:graphic/graphic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aquafatec',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemperatureScreen(),
    );
  }
}

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  MQTTClientManager mqttClientManager = MQTTClientManager();
  final String pubTopic = "aquafatec/tanque1/temperatura";
  String temperature = "0.0 ºC";
  String lastReadingDate = "N/A";
  int nextRowNumber = 1;
  late final DatabaseReference databaseReference;

  @override
  void initState() {
    super.initState();
    databaseReference = FirebaseDatabase.instance.ref().child("temperature");
    setupMqttClient();
    setupUpdatesListener();
    fetchLastReading();
  }

  Future<void> fetchLastReading() async {
    try {
      DatabaseEvent event = await databaseReference.orderByChild('row_number').limitToLast(1).once();

      if (event.snapshot.exists) {
        Map<dynamic, dynamic> data = event.snapshot.value as Map<dynamic, dynamic>;
        data.forEach((key, value) {
          setState(() {
            temperature = '${value['value']} ºC';
            lastReadingDate = value['timestamp'];
          });
        });
      }
    } catch (e) {
      print('Erro ao buscar a última leitura: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.color4,
      appBar: CustomAppBar(
        title: 'Temperatura',
        subtitle: 'Confira detalhes do seu dispositivo',
        showBackButton: true,
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
              tag: 'temperature_image',
              child: Image.asset(
                'assets/ph_mensal.png',
                width: double.infinity,
                height: 250,
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(height: 10),
            _buildInfoBox('Última leitura:', lastReadingDate, fontSize: 16),
            _buildInfoBox('Valor da leitura:', temperature, fontSize: 16),
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
            offset: const Offset(0, 2),
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
          Text(
            value,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> setupMqttClient() async {
    await mqttClientManager.connect();
    mqttClientManager.subscribe(pubTopic);
  }

  void setupUpdatesListener() {
    mqttClientManager.getMessagesStream()!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      setState(() {
        temperature = '$pt ºC';
        final parsedTimestamp = DateTime.now();
        final formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
        final formattedTimestamp = formatter.format(parsedTimestamp);

        final rowRef = databaseReference.push();
        rowRef.set({
          "row_number": nextRowNumber++,
          "timestamp": formattedTimestamp,
          "value": pt
        });

        lastReadingDate = formattedTimestamp;
      });
    });
  }
}
