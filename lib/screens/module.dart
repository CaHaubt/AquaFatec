import 'package:flutter/material.dart';
import '/widgets/navibar.dart';
import '/widgets/appbar.dart';
import '/widgets/colors.dart';
import 'package:intl/intl.dart';
import 'settings/alimentador_edit.dart';

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
  String formattedDate = '';

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

    return Scaffold(
      backgroundColor: MyColors.color4,
      appBar: CustomAppBar(
        title: 'Dashboard - ${widget.moduleName}',
        subtitle: 'Confira detalhes do seu sensor',
        showBackButton: true, // Exibe o botão de voltar apenas nesta tela
        onBackButtonPressed: () {
          Navigator.pushNamed(context, '/home');
        }, // Adicione esta linha
      ), // Corrija o fechamento do parêntese
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.moduleName == 'pH') ...{
              Image.asset(
                'assets/grafico.png',
                width: double.infinity,
                height: 200,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 10),
              _buildInfoBox('Última leitura:', formattedDate, fontSize: 16),
              _buildInfoBox('Valor da leitura:', '7,8', fontSize: 16),
              _buildInfoBox('Status do sensor:', 'ATIVO', fontSize: 16),
            } else if (widget.moduleName == 'Alimentador') ...
            {Image.asset(
              'assets/grafico.png',
              width: double.infinity,
              height: 200,
              alignment: Alignment.center,
              ),
              const SizedBox(height: 10),
              _buildInfoBox('Quantidade de peixes:', widget.quantidadeDePeixes, fontSize: 16),
              _buildInfoBox('Quantidade (em gramas) por peixe:', widget.quantidadePorPeixe, fontSize: 16),
              _buildInfoBox('Último arraçoamento:', lastFeedingDate, fontSize: 16),
              _buildInfoBox('Status do alimentador:', 'ATIVO', fontSize: 16),
              const SizedBox(height: 16),
            },
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
