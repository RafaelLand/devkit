import 'package:flutter/material.dart';
import 'package:devkit/Material/lista_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MaterialTextFieldExample());

class MaterialTextFieldExample extends StatelessWidget {
  const MaterialTextFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TextFields Material',
      theme: ThemeData(useMaterial3: true),
      home: const MaterialTextFieldScreen(),
    );
  }
}

class MaterialTextFieldScreen extends StatefulWidget {
  const MaterialTextFieldScreen({super.key});

  @override
  State<MaterialTextFieldScreen> createState() =>
      _MaterialTextFieldScreenState();
}

class _MaterialTextFieldScreenState extends State<MaterialTextFieldScreen> {
  final _simpleCtrl = TextEditingController();
  final _mailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _multiCtrl = TextEditingController();

  bool _obscurePass = true;

  // Validação de e-mail
  String? get _emailError {
    final text = _mailCtrl.text;
    if (text.isEmpty) return null;
    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    if (!emailRegex.hasMatch(text)) return 'E-mail inválido';
    return null;
  }

  @override
  void dispose() {
    _simpleCtrl.dispose();
    _mailCtrl.dispose();
    _passCtrl.dispose();
    _multiCtrl.dispose();
    super.dispose();
  }

  // Estilos reutilizáveis
  TextStyle get _label => const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );

  TextStyle get _output => const TextStyle(
        fontSize: 12,
        color: Colors.black,
      );

  // Decoração reutilizável para os campos
  InputDecoration _dec(
    String hint, {
    IconData? icon,
    bool filled = false,
    bool outlined = false,
    Widget? suffixIcon,
    String? errorText,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: icon != null ? Icon(icon, color: Colors.blue) : null,
      suffixIcon: suffixIcon,
      filled: filled,
      fillColor: filled ? Colors.white : null,
      border:
          outlined ? const OutlineInputBorder() : const UnderlineInputBorder(),
      errorText: errorText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          "Exemplo de TextField Material",
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
                  "https://github.com/RafaelLand/devkit/blob/main/lib/Material/Text_Field.dart"));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1) TextField simples
            Text('TextField Simples:', style: _label),
            const SizedBox(height: 8),
            TextField(
              controller: _simpleCtrl,
              style: const TextStyle(color: Colors.black),
              decoration: _dec('Digite algo...'),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 4),
            SelectableText('Valor: ${_simpleCtrl.text}', style: _output),
            const SizedBox(height: 24),

            // 2) TextField com ícone + borda outline + validação
            Text('Com Ícone + Outline + Validação:', style: _label),
            const SizedBox(height: 8),
            TextField(
              controller: _mailCtrl,
              style: const TextStyle(color: Colors.black),
              decoration: _dec(
                'Seu e-mail',
                icon: Icons.mail,
                outlined: true,
                errorText: _emailError,
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 4),
            SelectableText('Valor: ${_mailCtrl.text}', style: _output),
            const SizedBox(height: 24),

            // 3) TextField de senha (obscure) + modo filled + toggle
            Text('Senha (filled) + Mostrar/Ocultar:', style: _label),
            const SizedBox(height: 8),
            TextField(
              controller: _passCtrl,
              style: const TextStyle(color: Colors.black),
              decoration: _dec(
                'Digite a senha',
                filled: true,
                icon: Icons.lock,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePass ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () => setState(() => _obscurePass = !_obscurePass),
                ),
              ),
              obscureText: _obscurePass,
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 4),
            SelectableText('Senha: ${_passCtrl.text}', style: _output),
            const SizedBox(height: 24),

            // 4) TextField multilinha
            Text('Multilinha:', style: _label),
            const SizedBox(height: 8),
            TextField(
              controller: _multiCtrl,
              style: const TextStyle(color: Colors.black),
              decoration: _dec('Digite um texto longo...', outlined: true),
              maxLines: 4,
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 4),
            SelectableText('Texto: ${_multiCtrl.text}', style: _output),
            const SizedBox(height: 24),

            // 5) TextField desabilitado
            Text('Desabilitado:', style: _label),
            const SizedBox(height: 8),
            const TextField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Campo inativo',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
