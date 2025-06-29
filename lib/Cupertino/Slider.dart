import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:devkit/Cupertino/lista_widgets.dart';

void main() {
  runApp(const CupertinoSliderExample());
}

class CupertinoSliderExample extends StatelessWidget {
  const CupertinoSliderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Exemplo de Slider Cupertino',
      debugShowCheckedModeBanner: false,
      home: CupertinoSliderExampleScreen(),
    );
  }
}

class CupertinoSliderExampleScreen extends StatefulWidget {
  const CupertinoSliderExampleScreen({super.key});

  @override
  State<CupertinoSliderExampleScreen> createState() =>
      _CupertinoSliderExampleScreenState();
}

class _CupertinoSliderExampleScreenState
    extends State<CupertinoSliderExampleScreen> {
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Variações de Cards Material",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 0.5,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CupertinoWidgetsListScreen(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.link),
            onPressed: () {
              // Adicione aqui a ação de anexar link
            },
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.systemGrey.withOpacity(0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoSlider(
                  value: _sliderValue,
                  min: 0.0,
                  max: 1.0,
                  activeColor: CupertinoColors.activeBlue,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  "Valor do slider: ${(_sliderValue * 100).toStringAsFixed(0)}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.activeBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
