import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:devkit/Cupertino/lista_widgets.dart';

void main() {
  runApp(const CupertinoTextFieldExample());
}

class CupertinoTextFieldExample extends StatelessWidget {
  const CupertinoTextFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Exemplos de TextField Cupertino",
      debugShowCheckedModeBanner: false,
      home: CupertinoTextFieldExampleScreen(),
    );
  }
}

class CupertinoTextFieldExampleScreen extends StatefulWidget {
  const CupertinoTextFieldExampleScreen({super.key});

  @override
  State<CupertinoTextFieldExampleScreen> createState() =>
      _CupertinoTextFieldExampleScreenState();
}

class _CupertinoTextFieldExampleScreenState
    extends State<CupertinoTextFieldExampleScreen> {
  // Controllers
  final TextEditingController _simpleController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // State variables
  String _simpleText = "";
  String _emailText = "";
  String _passwordText = "";
  bool _obscurePassword = true;

  // Styles
  final TextStyle headingStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: CupertinoColors.black,
  );

  final TextStyle outputStyle = const TextStyle(
    fontSize: 12,
    color: CupertinoColors.black,
  );

  // Box decoration for TextFields
  BoxDecoration get _boxDecoration => BoxDecoration(
        color: CupertinoColors.white,
        border: Border.all(color: CupertinoColors.systemGrey3, width: 1.2),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey4.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      );

  // Email validation
  String? _validateEmail(String value) {
    if (value.isEmpty) return null;
    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    if (!emailRegex.hasMatch(value)) {
      return "E-mail inválido";
    }
    return null;
  }

  @override
  void dispose() {
    _simpleController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailError = _validateEmail(_emailText);

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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Exemplo 1: TextField simples com clear button
              Text("TextField Simples:", style: headingStyle),
              const SizedBox(height: 8),
              CupertinoTextField(
                controller: _simpleController,
                placeholder: "Digite algo...",
                placeholderStyle:
                    const TextStyle(color: CupertinoColors.systemGrey),
                onChanged: (value) => setState(() => _simpleText = value),
                clearButtonMode: OverlayVisibilityMode.editing,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                style: const TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 16,
                ),
                decoration: _boxDecoration,
              ),
              const SizedBox(height: 4),
              Text("Valor digitado: $_simpleText", style: outputStyle),
              const SizedBox(height: 24),

              // Exemplo 2: TextField com prefixo (ícone), clear button e validação de e-mail
              Text("TextField com prefixo:", style: headingStyle),
              const SizedBox(height: 8),
              CupertinoTextField(
                controller: _emailController,
                placeholder: "Seu email",
                placeholderStyle:
                    const TextStyle(color: CupertinoColors.systemGrey),
                prefix: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    CupertinoIcons.mail,
                    color: CupertinoColors.activeBlue,
                  ),
                ),
                onChanged: (value) => setState(() => _emailText = value),
                clearButtonMode: OverlayVisibilityMode.editing,
                cursorColor: CupertinoColors.activeBlue,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: _boxDecoration.copyWith(
                  border:
                      Border.all(color: CupertinoColors.activeBlue, width: 1.5),
                ),
                style: const TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 16,
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                enableSuggestions: false,
              ),
              if (emailError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    emailError,
                    style: const TextStyle(
                      color: CupertinoColors.systemRed,
                      fontSize: 12,
                    ),
                  ),
                ),
              if (emailError == null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child:
                      Text("Valor digitado: $_emailText", style: outputStyle),
                ),
              const SizedBox(height: 24),

              // Exemplo 3: TextField para senha com toggle de visibilidade
              Text("TextField de Senha:", style: headingStyle),
              const SizedBox(height: 8),
              CupertinoTextField(
                controller: _passwordController,
                placeholder: "Digite sua senha",
                placeholderStyle:
                    const TextStyle(color: CupertinoColors.systemGrey),
                obscureText: _obscurePassword,
                onChanged: (value) => setState(() => _passwordText = value),
                clearButtonMode: OverlayVisibilityMode.editing,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                style: const TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 16,
                ),
                decoration: _boxDecoration.copyWith(
                  border:
                      Border.all(color: CupertinoColors.systemGrey, width: 1.2),
                ),
                suffix: GestureDetector(
                  onTap: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      _obscurePassword
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text("Senha digitada: $_passwordText", style: outputStyle),
              const SizedBox(height: 24),

              // Exemplo 4: TextField desabilitado
              Text("TextField Desabilitado:", style: headingStyle),
              const SizedBox(height: 8),
              CupertinoTextField(
                placeholder: "Campo desabilitado",
                placeholderStyle:
                    const TextStyle(color: CupertinoColors.systemGrey),
                enabled: false,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                style: const TextStyle(
                  color: CupertinoColors.inactiveGray,
                  fontSize: 16,
                ),
                decoration: _boxDecoration.copyWith(
                  color: CupertinoColors.systemGrey5,
                  border: Border.all(color: CupertinoColors.systemGrey4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
