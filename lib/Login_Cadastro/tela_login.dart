import 'package:devkit/listaTelaInicial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tela_cadastro.dart'; // Importando a tela de cadastro
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

void main() {
  runApp(const tela_login());
}

class tela_login extends StatelessWidget {
  const tela_login({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Exemplo de Login Cupertino',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  // Instância única do banco de dados
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      path.join(dbPath, 'login.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT NOT NULL UNIQUE,
            password TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<bool> _checkCredentials(String email, String senha) async {
    final dbInstance = await database;
    try {
      final result = await dbInstance.query(
        'users',
        where: 'email = ? AND password = ?',
        whereArgs: [email, senha],
      );
      return result.isNotEmpty;
    } catch (e) {
      // Handle database errors gracefully
      debugPrint('Database error: $e');
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final email = _emailController.text;
      final senha = _passwordController.text;
      final isValid = await _checkCredentials(email, senha);

      if (!mounted) return;

      if (isValid) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (BuildContext context) => const ListaTelaInicial(),
          ),
        );
      } else {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text('Erro'),
            content: const Text('Credenciais inválidas!'),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _isLoading = false;
                  });
                },
              )
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Cores azul e azul claro
    const Color darkBlue = Color(0xFF1565C0);
    const Color lightBlue = Color(0xFF90CAF9);

    return CupertinoPageScaffold(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [darkBlue, lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 48,
                        backgroundColor: Colors.white,
                        child: Icon(
                          CupertinoIcons.person_alt,
                          size: 60,
                          color: darkBlue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Bem-vindo!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Faça login para continuar',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 32),
                    CupertinoTextFormFieldRow(
                      controller: _emailController,
                      placeholder: "Seu email",
                      prefix:
                          const Icon(CupertinoIcons.mail, color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor, insira o email";
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return "Por favor, insira um email válido";
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      placeholderStyle: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 16),
                    CupertinoTextFormFieldRow(
                      controller: _passwordController,
                      placeholder: "Senha",
                      prefix:
                          const Icon(CupertinoIcons.lock, color: Colors.white),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor, insira a senha";
                        }
                        if (value.length < 6) {
                          return "A senha deve ter no mínimo 6 caracteres";
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      placeholderStyle: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 24),
                    _isLoading
                        ? const CupertinoActivityIndicator(color: Colors.white)
                        : SizedBox(
                            width: double.infinity,
                            child: CupertinoButton(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              onPressed: _login,
                              child: const Text(
                                "Entrar",
                                style: TextStyle(
                                  color: darkBlue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                    CupertinoButton(
                      child: const Text(
                        "Nao tem uma conta? Cadastre-se",
                        style: TextStyle(color: Colors.white70),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const tela_cadastro(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
