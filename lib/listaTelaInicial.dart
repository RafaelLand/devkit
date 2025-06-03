import 'package:flutter/material.dart';
import 'package:devkit/Buttons.dart'; // Certifique-se de que este arquivo existe

class Listatelainicial extends StatelessWidget {
  const Listatelainicial({super.key});

  @override
  Widget build(context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 18, // Tamanho do texto
        fontFamily: 'Roboto', // Fonte desejada
        fontWeight: FontWeight.bold, // Peso da fonte
        color: Colors.black, // Cor do texto
      ),
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Material(
            child: Ink(
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[50],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MaterialButtonsExample(), // Página de destino
                    ),
                  );
                },
                child: Center(child: Text('Botoes')),
              ),
            ),
          ),
          const Divider(height: 25, thickness: 2),
          Material(
            child: Ink(
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[100],
              ),
              child: InkWell(
                onTap: () {},
                child: const Center(child: Text('Texto B')), // Const removido
              ),
            ),
          ),
          const Divider(height: 25, thickness: 2),
          Material(
            child: Ink(
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[200],
              ),
              child: InkWell(
                onTap: () {},
                child: const Center(child: Text('Texto C')), // Const removido
              ),
            ),
          ),
        ],
      ),
    );
  }
}
