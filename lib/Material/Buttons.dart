import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MaterialButtonsExample extends StatefulWidget {
  const MaterialButtonsExample({super.key});

  @override
  State<MaterialButtonsExample> createState() => _MaterialButtonsExampleState();
}

class _MaterialButtonsExampleState extends State<MaterialButtonsExample> {
  bool _isLoading = false;
  bool _isToggled = false;

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
        title: const Text(
          "Exemplo de Botão Material",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 0.5,
            color: Colors.blue,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.link, color: Colors.blue),
            onPressed: () {
              launchUrl(Uri.parse(
                  "https://github.com/RafaelLand/devkit/blob/main/lib/Material/Buttons.dart"));
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        foregroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildMaterialButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () => _showNotification('ElevatedButton pressed'),
          child: const Text('Elevated Button'),
        ),
        const SizedBox(height: 16),

        OutlinedButton(
          onPressed: () => _showNotification('OutlinedButton pressed'),
          child: const Text('Outlined Button'),
        ),
        const SizedBox(height: 16),

        TextButton(
          onPressed: () => _showNotification('TextButton pressed'),
          child: const Text('Text Button'),
        ),
        const SizedBox(height: 16),

        IconButton(
          onPressed: () => _showNotification('IconButton pressed'),
          icon: const Icon(Icons.thumb_up),
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            fixedSize: const Size(50, 50),
          ),
        ),
        const SizedBox(height: 16),

        FloatingActionButton(
          onPressed: () => _showNotification('FloatingActionButton pressed'),
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 16),

        ElevatedButton.icon(
          onPressed: () =>
              _showNotification('ElevatedButton with Icon pressed'),
          icon: const Icon(Icons.send),
          label: const Text('Send'),
        ),
        const SizedBox(height: 16),

        OutlinedButton.icon(
          onPressed: () =>
              _showNotification('OutlinedButton with Icon pressed'),
          icon: const Icon(Icons.info),
          label: const Text('Info'),
        ),
        const SizedBox(height: 16),

        ElevatedButton(
          onPressed: null,
          child: const Text('Disabled Elevated Button'),
        ),
        const SizedBox(height: 16),

        OutlinedButton(
          onPressed: null,
          child: const Text('Disabled Outlined Button'),
        ),
        const Divider(height: 32),

        // Toggle Button Example
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _isToggled ? Colors.green : Colors.grey,
          ),
          onPressed: () {
            setState(() => _isToggled = !_isToggled);
            _showNotification(_isToggled ? 'Ativado' : 'Desativado');
          },
          child: Text(_isToggled ? 'Ativado' : 'Desativado'),
        ),
        const SizedBox(height: 16),

        // Loading Button Example
        ElevatedButton(
          onPressed: _isLoading
              ? null
              : () async {
                  setState(() => _isLoading = true);
                  await Future.delayed(const Duration(seconds: 2));
                  setState(() => _isLoading = false);
                  _showNotification('Ação concluída!');
                },
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Text('Botão com Loading'),
        ),
        const SizedBox(height: 16),

        // Popup Menu Button Example
        PopupMenuButton<String>(
          onSelected: (value) => _showNotification('Selecionado: $value'),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'Opção 1',
              child: Text('Opção 1'),
            ),
            const PopupMenuItem(
              value: 'Opção 2',
              child: Text('Opção 2'),
            ),
          ],
          child: ElevatedButton(
            onPressed: null,
            child: const Text('Popup Menu Button'),
          ),
        ),
        const SizedBox(height: 16),

        // Custom Color Button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 8,
          ),
          onPressed: () => _showNotification('Botão customizado!'),
          child: const Text('Botão Customizado'),
        ),
      ],
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaterialButtonsExample(),
    ),
  );
}
