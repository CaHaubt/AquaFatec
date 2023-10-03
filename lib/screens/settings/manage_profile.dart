import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importe este pacote para usar o TextEditingController
import '/widgets/navibar.dart';
import '/widgets/appbar.dart';
import '/widgets/colors.dart';

class ManageProfileScreen extends StatefulWidget {
  @override
  _ManageProfileScreenState createState() => _ManageProfileScreenState();
}

class _ManageProfileScreenState extends State<ManageProfileScreen> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaAtualController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();

  bool _showSenhaAtual =
      false; // Variável de controle para mostrar/ocultar a senha atual
  bool _showSenhaNova =
      false; // Variável de controle para mostrar/ocultar a nova senha
  bool _showConfirmarSenha =
      false; // Variável de controle para mostrar/ocultar a confirmação da senha
  String nomeUsuarioAtual =
      'Nome de Usuário'; // Substitua pelo nome do usuário atual
  bool alteracoesEfetuadasComSucesso =
      false; // Adicionado para controlar o sucesso das alterações

  @override
  void initState() {
    super.initState();
    // Carregar os dados do perfil aqui, se necessário
    // Por exemplo:
    // nomeController.text = 'Nome do Usuário';
    // emailController.text = 'email@exemplo.com';
  }

  void _updateProfile() {
    // Verifique se o campo de senha atual está vazio
    if (senhaAtualController.text.isEmpty) {
      _showErrorDialog("Erro ao efetuar alterações",
          "Por favor, informe a senha atual corretamente para continuar.");
      return;
    }

    // Implemente a lógica para verificar a senha atual e atualizar o perfil aqui
    // Você pode acessar os valores dos controladores:
    // nomeController.text
    // emailController.text
    // senhaAtualController.text
    // senhaController.text
    // confirmarSenhaController.text

    // Simulando um caso de sucesso para teste
    alteracoesEfetuadasComSucesso = true;

    if (alteracoesEfetuadasComSucesso) {
      _showSuccessDialog();
    } else {
      // Se as alterações não forem bem-sucedidas, você pode mostrar uma mensagem de erro na mesma tela
      _showErrorDialog("Erro ao efetuar alterações",
          "Não foi possível atualizar o perfil. Por favor, tente novamente.");
    }
  }

  Future<void> _showSuccessDialog() async {
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
                  'Pressione "OK" para continuar.',
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
                    // Redirecione para a tela de perfil
                    Navigator.of(context).pushReplacementNamed('/profile');
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

  Future<void> _showErrorDialog(String title, String message) async {
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
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: MyColors.color2, // Defina a cor para MyColors.color2
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: MyColors.color1, // Defina a cor para MyColors.color1
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
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
                      color:
                          MyColors.color2, // Defina a cor para MyColors.color2
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
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Gerenciar Perfil',
        subtitle: "Gerencie suas informações pessoais",
        showBackButton: true,
        onBackButtonPressed: () {
          Navigator.pushNamed(context, '/profile');
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Atualize seus dados de perfil',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: MyColors.color3,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.0),
              TextFormField(
                controller: TextEditingController(text: nomeUsuarioAtual),
                readOnly: true, // Torna o campo de nome somente leitura
                style: TextStyle(
                  color:
                      Colors.grey, // Cor do texto do campo de nome desabilitado
                ),
                decoration: InputDecoration(
                  labelText: 'Nome de Usuário atual (Não modificável)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  enabledBorder: OutlineInputBorder(
                    // Estilo da borda quando o campo está desabilitado
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: Colors.grey, // Cor da borda
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Endereço de E-mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: senhaAtualController,
                obscureText: !_showSenhaAtual,
                // Use a variável de controle correspondente
                decoration: InputDecoration(
                  labelText: 'Senha Atual',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showSenhaAtual ? Icons.visibility : Icons.visibility_off,
                      // Alterna entre os ícones de olho
                      color: Colors.grey, // Cor dos ícones
                    ),
                    onPressed: () {
                      setState(() {
                        _showSenhaAtual =
                            !_showSenhaAtual; // Alterne o estado da variável de controle
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: senhaController,
                obscureText: !_showSenhaNova,
                // Use a variável de controle correspondente
                decoration: InputDecoration(
                  labelText: 'Nova Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showSenhaNova ? Icons.visibility : Icons.visibility_off,
                      // Alterna entre os ícones de olho
                      color: Colors.grey, // Cor dos ícones
                    ),
                    onPressed: () {
                      setState(() {
                        _showSenhaNova =
                            !_showSenhaNova; // Alterne o estado da variável de controle
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: confirmarSenhaController,
                obscureText: !_showConfirmarSenha,
                // Use a variável de controle correspondente
                decoration: InputDecoration(
                  labelText: 'Confirmar Nova Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showConfirmarSenha
                          ? Icons.visibility
                          : Icons
                              .visibility_off, // Alterna entre os ícones de olho
                      color: Colors.grey, // Cor dos ícones
                    ),
                    onPressed: () {
                      setState(() {
                        _showConfirmarSenha =
                            !_showConfirmarSenha; // Alterne o estado da variável de controle
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _updateProfile(); // Chama a função para atualizar o perfil
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
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3,
        onTap: (menu) {
          // Implemente a navegação para as outras telas aqui, se necessário
          if (menu == 0) {
            Navigator.pushNamed(context, '/menu');
          } else if (menu == 1) {
            Navigator.pushNamed(context, '/module');
          } else if (menu == 2) {
            Navigator.pushNamed(context, '/notifications');
          }
        },
      ),
    );
  }
}
