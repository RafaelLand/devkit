import 'package:flutter/material.dart';
import 'package:devkit/listaTelaInicial.dart';
import 'package:devkit/Login_Cadastro/tela_login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: tela_login(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: ListaTelaInicial()),
        ],
      ),
    );
  }
}
