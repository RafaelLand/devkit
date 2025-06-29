import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoListTileApp());
}

class CupertinoListTileApp extends StatelessWidget {
  const CupertinoListTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoListTileExample(),
    );
  }
}

class CupertinoListTileExample extends StatelessWidget {
  const CupertinoListTileExample({super.key});

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.15),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CupertinoColors.activeBlue.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(10),
            child: Icon(
              icon,
              color: CupertinoColors.activeBlue,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.label,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            CupertinoIcons.chevron_forward,
            color: CupertinoColors.systemGrey2,
            size: 22,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          "Exemplo de ListTile Cupertino",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 0.5,
            color: CupertinoColors.activeBlue,
          ),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.of(context).maybePop(),
          child: const Icon(
            CupertinoIcons.back,
            color: CupertinoColors.activeBlue,
          ),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // ação para anexar link
          },
          child: const Icon(
            CupertinoIcons.link,
            color: CupertinoColors.activeBlue,
          ),
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildListTile(
              icon: CupertinoIcons.person,
              title: 'Profile',
              subtitle: 'View your profile',
            ),
            _buildListTile(
              icon: CupertinoIcons.settings,
              title: 'Settings',
              subtitle: 'App settings',
            ),
            _buildListTile(
              icon: CupertinoIcons.info,
              title: 'About',
              subtitle: 'About this app',
            ),
          ],
        ),
      ),
    );
  }
}
