import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:devkit/Cupertino/lista_widgets.dart';

void main() => runApp(const CupertinoCardExample());

class CupertinoCardExample extends StatelessWidget {
  const CupertinoCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const VariedCardScreenWithNavIcons(),
    );
  }
}

class VariedCardScreenWithNavIcons extends StatelessWidget {
  const VariedCardScreenWithNavIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: VariedCardsContent(),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
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
            // Ação de anexar link
          },
        ),
      ],
      backgroundColor: Colors.white,
      foregroundColor: Colors.blue,
      elevation: 0,
    );
  }
}

class VariedCardsContent extends StatelessWidget {
  const VariedCardsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasicCard(),
        ImageCard(),
        GradientCard(),
      ],
    );
  }
}

// Card 1: Card básico com sombra.
class BasicCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.black.withAlpha(25),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
        border: Border.all(
          color: CupertinoColors.white,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CupertinoColors.systemBlue.withAlpha(30),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(10),
            child: const Icon(
              CupertinoIcons.square_list,
              color: CupertinoColors.activeBlue,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Card Básico",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.black,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Este é um card simples com sombra.",
                  style: TextStyle(
                    fontSize: 15,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Card 2: Card com placeholder para imagem.
class ImageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.black.withAlpha(15),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
        border: Border.all(
          color: CupertinoColors.systemGrey4,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            child: Container(
              height: 140,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFB3E5FC), Color(0xFF0288D1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: Icon(
                  CupertinoIcons.photo,
                  size: 56,
                  color: CupertinoColors.white,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Card com Imagem",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.black,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Este card inclui um placeholder de imagem.",
                  style: TextStyle(
                    fontSize: 15,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Card 3: Card com fundo gradiente e botão integrado.
class GradientCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF42A5F5), Color(0xFF1976D2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.black.withAlpha(30),
            offset: const Offset(0, 6),
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Card com Gradiente",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: CupertinoColors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Este card tem um fundo gradiente e um botão integrado.",
            style: TextStyle(
              color: CupertinoColors.white,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 18),
          Align(
            alignment: Alignment.centerRight,
            child: CupertinoButton(
              color: CupertinoColors.white.withAlpha(220),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              onPressed: () => _showDialog(context),
              child: const Text(
                "Pressione",
                style: TextStyle(
                  color: CupertinoColors.activeBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return CupertinoAlertDialog(
          title: const Text("Ação"),
          content: const Text("Botão do card gradiente pressionado!"),
          actions: [
            CupertinoDialogAction(
              child: const Text("OK"),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
          ],
        );
      },
    );
  }
}
