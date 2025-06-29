import 'package:flutter/material.dart';
import 'package:devkit/Material/lista_widgets.dart';
import 'package:devkit/Cupertino/lista_widgets.dart';

class ListaTelaInicial extends StatelessWidget {
  const ListaTelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar para título e navegação
      appBar: AppBar(
        title: const Text(
          'DevKit - Tela Inicial',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
            color: Colors.blueAccent,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        // Removido o botão do AppBar (leading)
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: <Widget>[
            _buildCard(
              context: context,
              title: 'Material',
              icon: Icons.widgets,
              color: Colors.white,
              gradient: const LinearGradient(
                colors: [Color(0xFFBBDEFB), Color(0xFF64B5F6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MaterialWidgetsListScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            _buildCard(
              context: context,
              title: 'Cupertino',
              icon: Icons.phone_iphone,
              color: Colors.white,
              gradient: const LinearGradient(
                colors: [Color(0xFFB3E5FC), Color(0xFF4FC3F7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CupertinoWidgetsListScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Método auxiliar para construir os Cards com InkWell para feedback de toque
  Widget _buildCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color color,
    required Gradient gradient,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 8,
      margin: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 24),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 28,
                child: Icon(icon, size: 32, color: Colors.blueAccent),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios,
                  color: Colors.blueAccent, size: 22),
              const SizedBox(width: 24),
            ],
          ),
        ),
      ),
    );
  }
}
