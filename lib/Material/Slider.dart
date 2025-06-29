import 'package:flutter/material.dart';

void main() => runApp(const MaterialSliderExample());

class MaterialSliderExample extends StatelessWidget {
  const MaterialSliderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Variações de Botão Material",
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
              // Ação de anexar link
            },
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 0,
      ),
      body: const SafeArea(
        child: MaterialSliderDemo(),
      ),
    );
  }
}

class MaterialSliderDemo extends StatefulWidget {
  const MaterialSliderDemo({super.key});

  @override
  State<MaterialSliderDemo> createState() => _MaterialSliderDemoState();
}

class _MaterialSliderDemoState extends State<MaterialSliderDemo> {
  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Exemplo de tela de Slider Material',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 32),
        Text(
          'Valor: ${_sliderValue.toStringAsFixed(0)}',
          style: const TextStyle(fontSize: 18, color: Colors.blue),
        ),
        Slider(
          value: _sliderValue,
          min: 0,
          max: 100,
          divisions: 100,
          activeColor: Colors.blue,
          inactiveColor: Colors.blueAccent.withOpacity(0.2),
          label: _sliderValue.toStringAsFixed(0),
          onChanged: (value) {
            setState(() {
              _sliderValue = value;
            });
          },
        ),
      ],
    );
  }
}
