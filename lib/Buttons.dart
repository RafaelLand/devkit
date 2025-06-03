import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Para abrir links

class MaterialButtonsExample extends StatefulWidget {
  const MaterialButtonsExample({super.key});

  @override
  _MaterialButtonsExampleState createState() => _MaterialButtonsExampleState();
}

class _MaterialButtonsExampleState extends State<MaterialButtonsExample> {
  int _selectedIndex = 0; // Índice inicial do botão segmentado

  // Função para abrir o link
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse("https://github.com/RafaelLand"))) {
      throw Exception('Could not launch');
    }
  }

  // Função para exibir uma notificação (SnackBar)
  void _showNotification(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Voltar para a tela anterior
          },
        ),
        title: const Text('Exemplos de Botões'), // Texto centralizado no topo
        actions: [
          IconButton(
            icon: const Icon(Icons.link),
            onPressed: () {
              _launchUrl(); // Link para abrir
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Botão segmentado do Cupertino próximo da borda
          Padding(
            padding: const EdgeInsets.all(20), // Espaçamento próximo da borda
            child: SizedBox(
              height: 60,
              width: 500, // Altura maior para o botão segmentado
              child: CupertinoSlidingSegmentedControl<int>(
                backgroundColor: Colors.grey[300] ?? Colors.grey,
                thumbColor: _selectedIndex == 0
                    ? const Color.fromARGB(
                        255, 111, 194, 233) // Azul claro para "Material"
                    : const Color.fromARGB(
                        255, 118, 218, 120), // Verde para "Cupertino"
                groupValue: _selectedIndex,
                onValueChanged: (int? newIndex) {
                  setState(() {
                    _selectedIndex = newIndex!;
                  });
                },
                children: const {
                  0: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 15), // Aumenta o tamanho do texto
                    child: Text(
                      'Material',
                      style:
                          TextStyle(fontSize: 18), // Aumenta o tamanho da fonte
                    ),
                  ),
                  1: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 15), // Aumenta o tamanho do texto
                    child: Text(
                      'Cupertino',
                      style:
                          TextStyle(fontSize: 18), // Aumenta o tamanho da fonte
                    ),
                  ),
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Exibição condicional dos botões
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _selectedIndex == 0
                  ? _buildMaterialButtons() // Botões do Material
                  : _buildCupertinoButtons(), // Botões do Cupertino
            ),
          ),
        ],
      ),
    );
  }

  // Botões do Material
  Widget _buildMaterialButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            _showNotification('ElevatedButton pressed');
          },
          child: const Text('Elevated Button'),
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () {
            _showNotification('OutlinedButton pressed');
          },
          child: const Text('Outlined Button'),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            _showNotification('TextButton pressed');
          },
          child: const Text('Text Button'),
        ),
        const SizedBox(height: 16),
        IconButton(
          onPressed: () {
            _showNotification('IconButton pressed');
          },
          icon: const Icon(Icons.thumb_up),
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Bordas arredondadas
            ),
            backgroundColor: Colors.blue, // Cor de fundo
            fixedSize: const Size(50, 50), // Tamanho fixo (quadrado)
          ),
        ),
        const SizedBox(height: 16),
        FloatingActionButton(
          onPressed: () {
            _showNotification('FloatingActionButton pressed');
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () {
            _showNotification('ElevatedButton with Icon pressed');
          },
          icon: const Icon(Icons.send),
          label: const Text('Send'),
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () {
            _showNotification('OutlinedButton with Icon pressed');
          },
          icon: const Icon(Icons.info),
          label: const Text('Info'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: null, // Desabilitado
          child: const Text('Disabled Elevated Button'),
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: null, // Desabilitado
          child: const Text('Disabled Outlined Button'),
        ),
      ],
    );
  }

  // Botões do Cupertino
  Widget _buildCupertinoButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CupertinoButton(
          color: CupertinoColors.activeBlue,
          onPressed: () {
            _showNotification('CupertinoButton pressed');
          },
          child: const Text(
            'Cupertino Button',
            style: TextStyle(color: CupertinoColors.white),
          ),
        ),
        const SizedBox(height: 16),
        CupertinoButton.filled(
          onPressed: () {
            _showNotification('Cupertino Filled Button pressed');
          },
          child: const Text('Filled Button'),
        ),
        const SizedBox(height: 16),
        CupertinoButton(
          onPressed: () {
            _showNotification('Cupertino Text Button pressed');
          },
          child: const Text('Text Button'),
        ),
        const SizedBox(height: 16),
        CupertinoButton(
          color: CupertinoColors.systemRed,
          onPressed: () {
            _showNotification('Destructive Button pressed');
          },
          child: const Text('Destructive Button'),
        ),
        const SizedBox(height: 16),
        CupertinoButton(
          color: CupertinoColors.systemGreen,
          onPressed: () {
            _showNotification('Success Button pressed');
          },
          child: const Text('Success Button'),
        ),
        const SizedBox(height: 16),
        CupertinoButton(
          onPressed: () {
            _showNotification('Cupertino Icon Button pressed');
          },
          child: const Icon(CupertinoIcons.heart),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MaterialButtonsExample(),
  ));
}
