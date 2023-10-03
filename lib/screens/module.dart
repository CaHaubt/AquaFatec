import 'package:flutter/material.dart';
import '/widgets/navibar.dart';
import '/widgets/appbar.dart';
import '/widgets/colors.dart';
import 'package:intl/intl.dart';
import 'settings/alimentador_edit.dart';
import 'package:aquafatec/widgets/exclamationBox.dart';

class ModuleScreen extends StatefulWidget {
  final String moduleName;
  final String quantidadeDePeixes;
  final String quantidadePorPeixe;

  ModuleScreen({
    required this.moduleName,
    this.quantidadeDePeixes = '6',
    this.quantidadePorPeixe = '20',
  });

  @override
  _ModuleScreenState createState() => _ModuleScreenState();
}

class _ModuleScreenState extends State<ModuleScreen> {
  TextEditingController quantidadeController = TextEditingController();
  TextEditingController quantidadePorPeixeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    quantidadeController.text = widget.quantidadeDePeixes;
    quantidadePorPeixeController.text = widget.quantidadePorPeixe;
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = '';

    if (widget.moduleName == 'pH') {
      final currentDate = DateTime.now();
      formattedDate = DateFormat('dd/MM/yyyy HH:mm:ss').format(currentDate);
    }

    String lastFeedingDate = '';

    if (widget.moduleName == 'Alimentador') {
      final currentDate = DateTime.now();
      lastFeedingDate = DateFormat('dd/MM/yyyy HH:mm:ss').format(currentDate);
    }

    String lastWaterCheck = '';

    if (widget.moduleName == 'Nível d\'água') {
      final currentDate = DateTime.now();
      lastWaterCheck = DateFormat('dd/MM/yyyy HH:mm:ss').format(currentDate);
    }

    String lastOxygenCheck = '';

    if (widget.moduleName == 'Oxigênio') {
      final currentDate = DateTime.now();
      lastOxygenCheck = DateFormat('dd/MM/yyyy HH:mm:ss').format(currentDate);
    }

    String lastNTUCheck = '';

    if (widget.moduleName == 'Turbidez') {
      final currentDate = DateTime.now();
      lastNTUCheck = DateFormat('dd/MM/yyyy HH:mm:ss').format(currentDate);
    }

    return Scaffold(
      backgroundColor: MyColors.color4,
      appBar: CustomAppBar(
        title: 'Dashboard - ${widget.moduleName}',
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
            if (widget.moduleName == 'pH') ...{
              Hero(
                tag: 'ph_image',
                // Tag correspondente à imagem da tela HomeScreen
                child: Image.asset(
                  'assets/ph_mensal.png',
                  width: double.infinity,
                  height: 250,
                  alignment: Alignment.center,
                ),
              ),
              const SizedBox(height: 10),
              _buildInfoBox('Última leitura:', formattedDate, fontSize: 16),
              _buildInfoBox('Valor da leitura:', '7,8', fontSize: 16),
              _buildInfoBox('Status do sensor:', 'ATIVO', fontSize: 16),
            } else if (widget.moduleName == 'Alimentador') ...{
              Hero(
                tag: 'alimentador_image',
                // Tag correspondente à imagem da tela HomeScreen
                child: Image.asset(
                  'assets/arraçoamento_mensal.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 300,
                  alignment: Alignment.center,
                ),
              ),
              const SizedBox(height: 10),
              _buildInfoBox('Quantidade de peixes:', widget.quantidadeDePeixes,
                  fontSize: 16),
              _buildInfoBox('Quantidade (em gramas) por peixe:',
                  widget.quantidadePorPeixe,
                  fontSize: 16),
              _buildInfoBox('Último arraçoamento:', lastFeedingDate,
                  fontSize: 16),
              _buildInfoBox('Status do alimentador:', 'ATIVO', fontSize: 16),
              const SizedBox(height: 16),
            } else if (widget.moduleName == 'Nível d\'água') ...{
              Hero(
                tag: 'nivelAgua_image',
                // Tag correspondente à imagem da tela HomeScreen
                child: Image.asset(
                  'assets/niveldagua_mensal.png',
                  width: 500,
                  height: 300,
                  alignment: Alignment.center,
                ),
              ),
              const SizedBox(height: 10),
              _buildInfoBox('Nível d\'água atual no container:', '83%',
                  fontSize: 16),
              _buildInfoBox('Última leitura:', lastWaterCheck, fontSize: 16),
              _buildInfoBox('Último alerta:', '05/10/2023 14:34:12',
                  fontSize: 16),
              _buildInfoBox('Status do bombeamento:', 'ATIVO', fontSize: 16),
              const SizedBox(height: 16),
            } else if (widget.moduleName == 'Oxigênio') ...{
              Hero(
                tag: 'oxigenio_image',
                // Tag correspondente à imagem da tela HomeScreen
                child: Image.asset(
                  'assets/oxigenio_mensal.png',
                  width: 350,
                  height: 300,
                  alignment: Alignment.center,
                ),
              ),
              const SizedBox(height: 10),
              _buildInfoBox('Nível de O.D.(Oxigenio Dissolvido):', '7 mg/L',
                  fontSize: 16),
              _buildInfoBox('Última leitura:', lastOxygenCheck, fontSize: 16),
              _buildInfoBox('Último alerta:', '13/06/2023 05:42:35',
                  fontSize: 16),
              _buildInfoBox('Status do sensor:', 'ATIVO', fontSize: 16),
              const SizedBox(height: 16),
            } else if (widget.moduleName == 'Turbidez') ...{
              Hero(
                tag: 'turbidez_image',
                // Tag correspondente à imagem da tela HomeScreen
                child: Image.asset(
                  'assets/turbidez_mensal.png',
                  width: 350,
                  height: 300,
                  alignment: Alignment.center,
                ),
              ),
              const SizedBox(height: 10),
              ExclamationBox(
                label: "NTU:",
                value: "4.21",
                fontSize: 16.0,
                additionalText: "NTU (Nephelometric Turbidity Unit) é a unidade de medida da turbidez, indicando a quantidade de partículas em suspensão em um líquido.\nNo entanto, em geral, uma faixa de turbidez ideal para a maioria dos peixes em sistemas de aquaponia é de 10 NTU ou menos.\n\nValores de referência:\n0 - 5 = Água clara\n5 - 10 = Água levemente turva\nAcima de 10 = Água muito turva",
              ),
              _buildInfoBox('Condição da água:', 'Água clara', fontSize: 16),
              _buildInfoBox('Última leitura:', lastNTUCheck, fontSize: 16),
              _buildInfoBox('Último alerta:', '02/10/2023 02:12:23',
                  fontSize: 16),
              _buildInfoBox('Status do sensor:', 'ATIVO', fontSize: 16),
              const SizedBox(height: 16),
            }
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
      floatingActionButton: widget.moduleName == 'Alimentador'
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AlimentadorEditScreen(
                      quantidadeDePeixesAtual: widget.quantidadeDePeixes,
                      quantidadePorPeixeAtual: widget.quantidadePorPeixe,
                    ),
                  ),
                );
              },
              backgroundColor: MyColors.containerButton,
              child: Icon(
                Icons.edit,
                color: MyColors.color3,
              ),
            )
          : null,
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
          Text(
            value,
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
