import 'package:aquafatec/screens/settings/mqtt_manager.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import '../widgets/appbar.dart';
import '../widgets/colors.dart';
import '../widgets/navibar.dart';
import '../widgets/feed_time_box.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class FeederPage extends StatefulWidget {
  const FeederPage({super.key});

  @override
  State<FeederPage> createState() => _FeederPageState();
}

class _FeederPageState extends State<FeederPage> {
  MQTTClientManager mqttClientManager = MQTTClientManager();
  final String pubTopic = "aquafatec/tanque1/alimentador";
  final String feedType = "Ração X";
  String feedAmount = "100g";
  List<TimeOfDay> feedTimes = [TimeOfDay.now()];
  late SharedPreferences prefs;
  bool isRemoving = false;

  @override
  void initState() {
    super.initState();
    setupMqttClient();
    _loadFeedSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.color4,
      appBar: CustomAppBar(
        title: 'Alimentador',
        subtitle: 'Configurações de alimentação',
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
            const SizedBox(height: 10),
            _buildInfoBox('Tipo de ração:', feedType, fontSize: 16),
            _buildInfoBox('Gramas por porção:', feedAmount, fontSize: 16),
            const SizedBox(height: 20),
            const Text(
              'Horários de alimentação:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MyColors.color1,
              ),
            ),
            const SizedBox(height: 10),
            ...List.generate(
              feedTimes.length,
                  (index) => FeedTimeBox(
                index: index,
                feedTime: feedTimes[index],
                onRemovePressed: () {
                  _onRemoveFeedTimePressed(index);
                },
                isRemoving: isRemoving, // Adicionado para controlar o estado de remoção
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: isRemoving
          ? FloatingActionButton(
        onPressed: () {
          setState(() {
            isRemoving = false; // Desativar o modo de remoção
          });
        },
        child: const Icon(Icons.check, color: Colors.white),
        backgroundColor: Colors.green,
      )
          : SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: MyColors.color1,
        foregroundColor: Colors.white,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.delete, color: MyColors.color7),
            backgroundColor: MyColors.color2,
            label: 'Remover Horários',
            onTap: () {
              setState(() {
                isRemoving = true;
              });
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.edit, color: MyColors.color7),
            backgroundColor: MyColors.color3,
            label: 'Editar Gramatura',
            onTap: _onEditFeedAmountPressed,
          ),
          SpeedDialChild(
            child: const Icon(Icons.update, color: MyColors.color7),
            backgroundColor: MyColors.color3,
            label: 'Editar Horários',
            onTap: _onEditAllFeedTimesPressed,
          ),
          SpeedDialChild(
            child: const Icon(Icons.add, color: MyColors.color7),
            backgroundColor: MyColors.color3,
            label: 'Adicionar Horário',
            onTap: _onAddFeedTimePressed,
          ),
          SpeedDialChild(
            child: const Icon(Icons.play_arrow, color: MyColors.color7),
            backgroundColor: MyColors.color6,
            label: 'Testar conexão',
            onTap: _onTestPressed,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (menu) {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildInfoBox(String label, String value, {double fontSize = 16}) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 16.0),
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
              color: MyColors.color5,
            ),
          ),
        ],
      ),
    );
  }

  void _saveFeedSettings() async {
    prefs = await SharedPreferences.getInstance();
    final feedTimesList = feedTimes.map((time) => '${time.hour}:${time.minute}').toList();
    prefs.setStringList('feedTimes', feedTimesList);
    prefs.setString('feedAmount', feedAmount);
  }

  void _loadFeedSettings() async {
    prefs = await SharedPreferences.getInstance();
    final savedFeedTimes = prefs.getStringList('feedTimes') ?? [];
    final savedFeedAmount = prefs.getString('feedAmount') ?? "100g";
    setState(() {
      feedTimes = savedFeedTimes.map((timeStr) {
        final timeParts = timeStr.split(':');
        if (timeParts.length != 2) {
          return const TimeOfDay(hour: 0, minute: 0);
        }
        final hour = int.parse(timeParts[0]);
        final minute = int.parse(timeParts[1]);
        return TimeOfDay(hour: hour, minute: minute);
      }).toList();
      feedAmount = savedFeedAmount;
    });
  }

  void _onAddFeedTimePressed() {
    setState(() {
      feedTimes.add(TimeOfDay.now());
      _saveFeedSettings();
    });
  }

  void _onEditFeedTimePressed(int index) {
    showTimePicker(
      context: context,
      initialTime: feedTimes[index],
    ).then((selectedTime) {
      if (selectedTime != null) {
        setState(() {
          feedTimes[index] = selectedTime;
          _saveFeedSettings();
        });
      }
    });
  }

  void _onRemoveFeedTimePressed(int index) {
    setState(() {
      feedTimes.removeAt(index);
      _saveFeedSettings();
    });
  }

  void _onEditAllFeedTimesPressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Horários'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(feedTimes.length, (index) {
                return ListTile(
                  title: Text('${index + 1}º horário'),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.pop(context);
                      _onEditFeedTimePressed(index);
                    },
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  void _onEditFeedAmountPressed() {
    TextEditingController controller = TextEditingController(text: feedAmount);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Gramatura'),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Gramas por porção',
              hintText: 'Digite a quantidade em gramas',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  feedAmount = controller.text;
                  _saveFeedSettings();
                });
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> setupMqttClient() async {
    await mqttClientManager.connect();
  }

  void _onTestPressed() {
    mqttClientManager.publishMessage(pubTopic, '1');
  }
}
