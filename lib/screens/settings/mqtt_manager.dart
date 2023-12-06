import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_browser_client.dart'; //mqtt web
// import 'package:mqtt_client/mqtt_server_client.dart'; // mqtt celular


class MQTTClientManager { //classe responsável pela conexão
  // //construtor web
  MqttBrowserClient client =
  MqttBrowserClient('ws://mqtt', '');

  // //construtor Mqtt celular
  // MqttServerClient client = MqttServerClient('mqtt', " ");

  Future<int> connect() async { //configurar a conexão
    //conexão para navegador;
    client.port = 9001; // port 1883 para Mqtt celular OU port 9001 para web
    client.websocketProtocols = MqttClientConstants.protocolsSingleDefault;
    //fim conexão navegador

    client.logging(on: true);
    client.setProtocolV311();
    client.keepAlivePeriod = 60;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onSubscribed = onSubscribed;
    client.pongCallback = pong;

    final connMess = MqttConnectMessage()
        .withClientIdentifier('aquafatec')
        .withWillTopic('aquafatec/tanque1/online')
        .withWillMessage("offline")
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMess;

    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      print('MQTTClient: Client exception - $e');
      client.disconnect();
    } on SocketException catch (e) {
      print('MQTTClient: Socket exception - $e');
      client.disconnect();
    }

    return 0;
  }

  void disconnect(){
    client.disconnect();
  }

  void subscribe(String topic){
    client.subscribe(topic, MqttQos.atLeastOnce);
  }

  void onConnected() {
    print('MQTTClient:: Connected successfully!');
  }

  void onDisconnected(){
    print('MQTTClient::Disconnected');
  }

  void onSubscribed(String topic){
    print('MQTTClient::Subscribed to topic: $topic');
  }

  void pong() {
    print('MQTTClient: Ping from the broker');
  }

  void publishMessage(String topic, String message){
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
  }

  Stream<List<MqttReceivedMessage<MqttMessage>>>? getMessagesStream() {
    return client.updates;
  }
}
