import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoButtonsExample(),
    );
  }
}

class CupertinoButtonsExample extends StatelessWidget {
  const CupertinoButtonsExample({super.key});

  void showNotification(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text('Ação'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.of(ctx).pop(),
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
          "Exemplo de Botão Cupertino",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 0.5,
            color: CupertinoColors.activeBlue,
          ),
        ),
        leading: CupertinoNavigationBarBackButton(
          color: CupertinoColors.activeBlue,
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(
            CupertinoIcons.link,
            color: CupertinoColors.activeBlue,
          ),
          onPressed: () {
            launchUrl(Uri.parse(
                "https://github.com/RafaelLand/devkit/blob/main/lib/Cupertino/Buttons.dart"));
          },
        ),
        backgroundColor: CupertinoColors.white,
        border: null,
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 1. Botão básico (apenas texto)
            CupertinoButton(
              onPressed: () =>
                  showNotification(context, "Botão Básico pressionado"),
              child: const Text("Botão Básico"),
            ),
            const SizedBox(height: 16),

            // 2. Botão preenchido (estilo filled)
            CupertinoButton.filled(
              onPressed: () =>
                  showNotification(context, "Botão Preenchido pressionado"),
              child: const Text("Botão Preenchido"),
            ),
            const SizedBox(height: 16),

            // 3. Botão com ícone à esquerda
            CupertinoButton(
              onPressed: () =>
                  showNotification(context, "Botão com Ícone pressionado"),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(CupertinoIcons.add, size: 22),
                  SizedBox(width: 8),
                  Text("Com Ícone"),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 4. Botão customizado via Container com sombra
            Container(
              decoration: BoxDecoration(
                color: CupertinoColors.systemGreen,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: CupertinoButton(
                onPressed: () =>
                    showNotification(context, "Botão Customizado pressionado"),
                padding: const EdgeInsets.all(16),
                color: CupertinoColors.transparent,
                child: const Text(
                  "Customizado via Container",
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 5. Botão com efeito de opacidade ao pressionar
            CupertinoButton(
              onPressed: () =>
                  showNotification(context, "Botão com Opacidade pressionado"),
              pressedOpacity: 0.5,
              child: const Text("Com Pressed Opacity"),
            ),
            const SizedBox(height: 16),

            // 6. Botão com estilo customizado (texto grande, cor diferente)
            CupertinoButton(
              onPressed: () => showNotification(
                  context, "Botão Estilo Customizado pressionado"),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
              color: CupertinoColors.activeBlue,
              borderRadius: BorderRadius.circular(30),
              child: const Text(
                "Estilo Customizado",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 7. Botão desabilitado
            CupertinoButton(
              onPressed: null,
              child: const Text("Desabilitado"),
            ),
            const SizedBox(height: 16),

            // 8. Botão com loading (usando _CupertinoLoadingButton)
            _CupertinoLoadingButton(
              onShowNotification: (msg) => showNotification(context, msg),
            ),
          ],
        ),
      ),
    );
  }
}

class _CupertinoLoadingButton extends StatefulWidget {
  final void Function(String) onShowNotification;
  const _CupertinoLoadingButton({Key? key, required this.onShowNotification})
      : super(key: key);

  @override
  State<_CupertinoLoadingButton> createState() =>
      _CupertinoLoadingButtonState();
}

class _CupertinoLoadingButtonState extends State<_CupertinoLoadingButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: CupertinoColors.systemIndigo,
      onPressed: loading
          ? null
          : () {
              setState(() => loading = true);
              Future.delayed(const Duration(seconds: 1), () {
                setState(() => loading = false);
                widget.onShowNotification("Botão com Loading pressionado");
              });
            },
      child: loading
          ? const CupertinoActivityIndicator()
          : const Text("Com Loading"),
    );
  }
}
