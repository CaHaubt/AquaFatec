import 'package:flutter/material.dart';
import 'package:aquafatec/widgets/colors.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool showPassword = false;
  bool usernameError = false;
  bool emailError = false;
  bool passwordError = false;
  bool confirmPasswordError = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _usernameKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _emailKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _passwordKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _confirmPasswordKey = GlobalKey<FormFieldState<String>>();

  Future<void> _showCustomDialog(BuildContext context, String title, String content) async {
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
              color: MyColors.color4, // Coloque aqui a cor desejada
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
                    color: MyColors.color3, // Coloque aqui a cor desejada
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: MyColors.offToggle,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.color3, // Coloque aqui a cor desejada
                    fixedSize: Size(110, 20),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Coloque aqui a cor desejada
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo ao AquaFatec!',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: MyColors.color3,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Text(
                'Olá! Acredito que seja novo(a) aqui. Você pode começar a usar assim que efetuar a inscrição.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.0),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      key: _usernameKey,
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Nome do Usuário',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorText: usernameError ? 'Campo obrigatório' : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      key: _emailKey,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Endereço de E-mail',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorText: emailError ? 'Campo obrigatório' : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      key: _passwordKey,
                      controller: passwordController,
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            showPassword ? Icons.visibility : Icons.visibility_off,
                            color: MyColors.color1, // Coloque aqui a cor desejada
                          ),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                        errorText: passwordError ? 'Senhas incompatíveis' : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      key: _confirmPasswordKey,
                      controller: confirmPasswordController,
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                        labelText: 'Confirmar Senha',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            showPassword ? Icons.visibility : Icons.visibility_off,
                            color: MyColors.color1, // Coloque aqui a cor desejada
                          ),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                        errorText: confirmPasswordError ? 'Senhas incompatíveis' : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        if (value != passwordController.text) {
                          setState(() {
                            confirmPasswordError = true;
                          });
                          return 'Senhas incompatíveis';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            usernameError = false;
                            emailError = false;
                            passwordError = false;
                            confirmPasswordError = false;
                          });

                          if (_formKey.currentState!.validate()) {
                            final username = usernameController.text;
                            final email = emailController.text;
                            final password = passwordController.text;
                            final confirmPassword = confirmPasswordController.text;

                            await _showCustomDialog(
                              context,
                              'Cadastro realizado com sucesso',
                              'Pressione "OK" para continuar.',
                            );

                            Navigator.of(context).pushReplacementNamed('/login');
                          } else {
                            setState(() {
                              passwordError = true;
                              confirmPasswordError = true;
                            });

                            await _showCustomDialog(
                              context,
                              'Erro',
                              'Preencha todos os campos corretamente.\nPor favor, tente novamente.',
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.color3, // Coloque aqui a cor desejada
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        child: Text(
                          'Inscrever',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Coloque aqui a cor desejada
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: MyColors.color1, // Coloque aqui a cor desejada
                      ),
                      child: Text(
                        'Voltar para o login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
