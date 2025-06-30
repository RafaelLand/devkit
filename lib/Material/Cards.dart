import 'package:flutter/material.dart';
import 'package:devkit/Material/lista_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MaterialCardExample());

class MaterialCardExample extends StatelessWidget {
  const MaterialCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cards Material',
      theme: ThemeData(useMaterial3: true),
      home: const MaterialCardScreen(),
    );
  }
}

class MaterialCardScreen extends StatelessWidget {
  const MaterialCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exemplo de Cards Material",
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
                builder: (context) => const DevKitMaterialApp(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.link),
            onPressed: () {
              launchUrl(Uri.parse(
                  "https://github.com/RafaelLand/devkit/blob/main/lib/Material/Cards.dart"));
            },
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            _BasicCard(),
            _ImageCard(),
            _GradientCard(),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 1) Card básico: ícone + título/subtítulo
// -----------------------------------------------------------------------------
class _BasicCard extends StatelessWidget {
  const _BasicCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: const ListTile(
        leading: Icon(Icons.info, color: Colors.blue),
        title: Text(
          'Card Básico',
          style: TextStyle(color: Colors.black),
        ),
        subtitle: Text(
          'Título, subtítulo e ícone',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 2) Card com imagem na parte superior
// -----------------------------------------------------------------------------
class _ImageCard extends StatelessWidget {
  const _ImageCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      clipBehavior: Clip.antiAlias, // Para recortar bordas arredondadas
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder de imagem
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.grey.shade300,
            child: const Icon(Icons.photo, size: 60, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Card com Imagem',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 3) Card com fundo gradiente e botão interno
// -----------------------------------------------------------------------------
class _GradientCard extends StatelessWidget {
  const _GradientCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 0, // Sem sombra (o gradiente já chama atenção)
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF42A5F5), Color(0xFF1976D2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Card com Gradiente',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Botão embutido abaixo',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Botão do card gradiente pressionado'),
                  ),
                );
              },
              child: const Text('Pressione'),
            ),
          ],
        ),
      ),
    );
  }
}
