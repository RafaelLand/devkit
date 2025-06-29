import 'package:devkit/Cupertino/Cards.dart';
import 'package:devkit/Cupertino/List_Tile.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:devkit/Cupertino/Buttons.dart';
import 'package:devkit/Cupertino/Text_Field.dart';
import 'package:devkit/Cupertino/Slider.dart';
import 'package:devkit/listaTelaInicial.dart';

void main() {
  runApp(const DevKitMaterialApp());
}

class DevKitMaterialApp extends StatelessWidget {
  const DevKitMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevKit - Tela Inicial (Material)',
      debugShowCheckedModeBanner: false,
      home: CupertinoWidgetsListScreen(),
    );
  }
}

/// Função global para lançar um link
Future<void> launchLink(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $urlString');
  }
}

/// Tela que lista os widgets Cupertino utilizando botões com links atribuídos
/// e com tamanho ajustado via minimumSize.
class CupertinoWidgetsListScreen extends StatelessWidget {
  CupertinoWidgetsListScreen({super.key});

  // Lista com os nomes dos widgets para exibição dos botões.
  final List<Map<String, dynamic>> demoItems = [
    {
      "title": "Cupertino Button",
      "icon": Icons.radio_button_checked,
      "builder": () => const CupertinoButtonsExample(),
    },
    {
      "title": "Cupertino Card",
      "icon": Icons.credit_card,
      "builder": () => const CupertinoCardExample(),
    },
    {
      "title": "Cupertino ListTile",
      "icon": Icons.list,
      "builder": () => const CupertinoListTileExample(),
    },
    {
      "title": "Cupertino TextField",
      "icon": Icons.text_fields,
      "builder": () => const CupertinoTextFieldExample(),
    },
    {
      "title": "Cupertino Slider",
      "icon": Icons.tune,
      "builder": () => const CupertinoSliderExample(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Fundo mais suave
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          "Cupertino Widgets",
          style: TextStyle(
            color: Color(0xFF1565C0),
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1565C0)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ListaTelaInicial()));
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
          child: ListView.separated(
            itemCount: demoItems.length,
            separatorBuilder: (context, index) => const SizedBox(height: 18),
            itemBuilder: (context, index) {
              final buttonColor = [
                const Color(0xFF90CAF9),
                const Color(0xFF80DEEA),
                const Color(0xFFA5D6A7),
                const Color(0xFFFFF59D),
                const Color(0xFFFFAB91),
              ][index % 5];

              return Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(18),
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => demoItems[index]["builder"](),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: buttonColor.withOpacity(0.18),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 28, horizontal: 18),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.widgets,
                            color: buttonColor.darken(0.18),
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Text(
                            demoItems[index]["title"],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF263238),
                            ),
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            color: Color(0xFF1565C0), size: 20),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Extensão para escurecer a cor do ícone do avatar
extension ColorBrightness on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}
