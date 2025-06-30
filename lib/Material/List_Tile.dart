import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MaterialListTileExample());

class MaterialListTileExample extends StatelessWidget {
  const MaterialListTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Exemplo ListTile Material',
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.link, color: Colors.blue),
            onPressed: () {
              launchUrl(Uri.parse(
                  "https://github.com/RafaelLand/devkit/blob/main/lib/Material/List_Tile.dart"));
            },
          ),
        ],
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: ListView(
        children: [
          _buildListTile(
            avatarColor: Colors.blue.shade100,
            iconColor: Colors.blue,
            name: 'Alice Silva',
            subtitle: 'Desenvolvedora Flutter',
            trailingIcon: Icons.message,
            onTrailingPressed: () {
              // Ação para enviar mensagem
            },
          ),
          const Divider(),
          _buildListTile(
            avatarColor: Colors.green.shade100,
            iconColor: Colors.green,
            name: 'Bruno Costa',
            subtitle: 'Designer UI/UX',
            trailingIcon: Icons.email,
            onTrailingPressed: () {
              // Ação para enviar email
            },
          ),
          const Divider(),
          _buildListTile(
            avatarColor: Colors.orange.shade100,
            iconColor: Colors.orange,
            name: 'Carla Souza',
            subtitle: 'Gerente de Projeto',
            trailingIcon: Icons.phone,
            onTrailingPressed: () {
              // Ação para ligar
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required Color avatarColor,
    required Color iconColor,
    required String name,
    required String subtitle,
    required IconData trailingIcon,
    required VoidCallback onTrailingPressed,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: avatarColor,
        child: Icon(Icons.person, color: iconColor),
      ),
      title: Text(name),
      subtitle: Text(subtitle),
      trailing: IconButton(
        icon: Icon(trailingIcon, color: iconColor),
        onPressed: onTrailingPressed,
      ),
      onTap: () {
        // Ação ao tocar no ListTile
      },
    );
  }
}
