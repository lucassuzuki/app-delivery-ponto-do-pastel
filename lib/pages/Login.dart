// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:app_delivery_ponto_do_pastel/components/input.dart';
import 'package:app_delivery_ponto_do_pastel/components/primaryButton.dart';
import 'package:app_delivery_ponto_do_pastel/pages/home.dart';
import 'package:app_delivery_ponto_do_pastel/utils/snack.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _whatsappController = TextEditingController();
  bool _keepLoggedIn = false;

  void validaCampos() {
    if (formKey.currentState!.validate()) {
      SnackBarUtils.showSnackBar(context, 'Formulário enviado');
    } else {
      SnackBarUtils.showSnackBar(context, 'Os campos precisam ser preenchidos');
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _whatsappController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://raw.githubusercontent.com/WesleyRodrigues55/app-delivery-ponto-do-pastel/main/img/logo-pastel-fundo-amarelo.jpg',
                  ),
                  radius: 120,
                  // maxRadius: 90,
                ),
                InputCustom(
                  label: 'Usuario',
                  placeholder: 'Digite o seu Usuário',
                  controllerName: _nomeController,
                  validation: (value) {
                    if (value == null || value.length < 5) {
                      return 'Digite um nome de usuário válido!';
                    }
                    return null;
                  },
                ),
            
                InputCustom(
                  label: 'WhatsApp',
                  placeholder: 'Digite o seu WhatsApp',
                  controllerName: _whatsappController,
                  validation: (value) {
                    if (value == null || value.length < 10) {
                      return 'Digite um número de celular válido!';
                    }
                    return null;
                  },
                ),
            
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Checkbox(
                      value: _keepLoggedIn,
                      onChanged: (value) {
                        setState(() {
                          _keepLoggedIn = value!;
                        });
                      },
                    ),
                    const Text('Manter conectado'),
                  ],
                ),

                const SizedBox(height: 33.0),
                PrimaryButton(
                   onPressed: () {
                    validaCampos();
                  },
                  title: 'Entrar',
                  extraLarge: 1,
                ),
                SizedBox(height: 20),
                Center(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage(
                                title: 'teste',
                              )),
                    );
                  },
                  child: Text(
                    'Não tem uma conta? Registre agora',
                    style: TextStyle(
                        color: Color.fromARGB(62, 0, 0, 0),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Outfit'),
                  ),
                )),
                const SizedBox(height: 10),
                PrimaryButton(
                  onPressed: () {
                    print('email');
                  },
                  bgButton: Colors.black,
                  title: 'Entrar com o Google+',
                  extraLarge: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
