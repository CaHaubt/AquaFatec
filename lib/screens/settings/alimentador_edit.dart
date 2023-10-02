import 'package:flutter/material.dart';
import '/widgets/navibar.dart';
import '/widgets/appbar.dart';
import '/widgets/colors.dart';
import 'package:aquafatec/screens/module.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlimentadorEditScreen extends StatefulWidget {
  final String quantidadeDePeixesAtual;
  final String quantidadePorPeixeAtual;

  AlimentadorEditScreen({
    required this.quantidadeDePeixesAtual,
    required this.quantidadePorPeixeAtual,
  });

  @override
  _AlimentadorEditScreenState createState() => _AlimentadorEditScreenState();
}

class _AlimentadorEditScreenState extends State<AlimentadorEditScreen> {
  TextEditingController quantidadeController = TextEditingController();
  TextEditingController quantidadePorPeixeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    quantidadeController.text = widget.quantidadeDePeixesAtual;
    quantidadePorPeixeController.text = widget.quantidadePorPeixeAtual;
  }

  void _saveValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('quantidadeDePeixes', quantidadeController.text);
    prefs.setString('quantidadePorPeixe', quantidadePorPeixeController.text);
  }

  Future<void> _showSuccessDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MyColors.dialogBackground,
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Alterações efetuadas com sucesso',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: MyColors.dialogText,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Pressione "Ok" para continuar.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: MyColors.color1,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Redirecione para a tela ModuleScreen com o módulo "Alimentador"
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => ModuleScreen(
                          moduleName: 'Alimentador',
                          quantidadeDePeixes: quantidadeController.text,
                          quantidadePorPeixe: quantidadePorPeixeController.text,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.containerButton,
                    fixedSize: Size(110, 20),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: MyColors.color3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.color4,
      appBar: CustomAppBar(
        title: 'Dashboard - Alimentador',
        subtitle: 'Altere as configurações do seu alimentador',
        showBackButton: true, // Exibe o botão de voltar apenas nesta tela
        onBackButtonPressed: () {
          Navigator.pushNamed(context, '/home');
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildInfoBox(
              'Quantidade de peixes:',
              TextField(
                controller: quantidadeController,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: MyColors.color3,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            _buildInfoBox(
              'Quantidade (em gramas) por peixe:',
              TextField(
                controller: quantidadePorPeixeController,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: MyColors.color3,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (menu) {
          if (menu == 0) {
            _saveValues(); // Salva as alterações aqui, se necessário
            Navigator.pushNamed(context, '/home');
          } else if (menu == 1) {
            _saveValues(); // Salva as alterações aqui, se necessário
            // Atualize a tela ModuleScreen com os novos valores antes de navegar para ela
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ModuleScreen(
                  moduleName: 'Alimentador',
                  quantidadeDePeixes: quantidadeController.text,
                  quantidadePorPeixe: quantidadePorPeixeController.text,
                ),
              ),
            );
          } else if (menu == 2) {
            _saveValues(); // Salve as alterações aqui, se necessário
            Navigator.pushNamed(context, '/notifications');
          } else if (menu == 3) {
            _saveValues(); // Salve as alterações aqui, se necessário
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveValues(); // Salva as alterações aqui
          _showSuccessDialog(context); // Exibe o diálogo de sucesso
        },
        backgroundColor: Colors.green,
        child: Icon(
          Icons.check,
          color: Colors.white, // Defina a cor do ícone
          size: 32.0, // Defina o tamanho do ícone
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  Widget _buildInfoBox(String label, Widget inputField, {double fontSize = 16}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8), // Reduza o padding para alterar a altura
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
          Expanded(
            flex: 4, // Aumente a flexibilidade do rótulo para ocupar mais espaço
            child: Text(
              label,
              style: TextStyle(
                fontSize: fontSize, // Mantenha todas as fontes com tamanho 14
                fontWeight: FontWeight.bold,
                color: MyColors.color3,
              ),
            ),
          ),
          SizedBox(width: 10), // Espaço entre o rótulo e o campo de entrada
          Expanded(
            flex: 1, // Reduza a flexibilidade do campo de entrada para ocupar menos espaço
            child: Container(
              alignment: Alignment.centerRight,
              child: inputField, // Use o campo de entrada passado como argumento
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    quantidadeController.dispose();
    quantidadePorPeixeController.dispose();
    super.dispose();
  }
}
