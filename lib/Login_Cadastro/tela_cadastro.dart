import 'package:devkit/Login_Cadastro/tela_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:devkit/listaTelaInicial.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

// Simple LoginDatabase implementation for demonstration
class LoginDatabase {
  static final LoginDatabase instance = LoginDatabase._init();
  static Database? _database;

  LoginDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('login.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final fullPath = path.join(dbPath, filePath);
    return await openDatabase(
      fullPath,
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

  Future<bool> emailExists(String email) async {
    final db = await instance.database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }

  Future<void> createUser(String email, String password) async {
    final db = await instance.database;
    await db.insert(
      'users',
      {'email': email, 'password': password},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

void main() {
  runApp(const tela_cadastro());
}

class tela_cadastro extends StatelessWidget {
  const tela_cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Exemplo de Cadastro Cupertino',
      debugShowCheckedModeBanner: false,
      home: CadastroScreen(),
    );
  }
}

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                            color: Colors.black.withAlpha(25),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 48,
                        backgroundColor: Colors.white,
                        child: Icon(
                          CupertinoIcons.person_add,
                          size: 60,
                          color: darkBlue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Crie sua conta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Preencha os campos para se cadastrar',
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
                        color: Colors.white.withAlpha(38),
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
                        color: Colors.white.withAlpha(38),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      placeholderStyle: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 16),
                    CupertinoTextFormFieldRow(
                      controller: _confirmPasswordController,
                      placeholder: "Confirme a senha",
                      prefix:
                          const Icon(CupertinoIcons.lock, color: Colors.white),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor, confirme a senha";
                        }
                        if (value != _passwordController.text) {
                          return "As senhas não coincidem";
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(38),
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
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    _isLoading = true;
                                  });

                                  // Verifica se o email já existe
                                  bool exists = await LoginDatabase.instance
                                      .emailExists(_emailController.text);
                                  if (exists) {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    showCupertinoDialog(
                                      context: context,
                                      builder: (BuildContext dialogContext) =>
                                          CupertinoAlertDialog(
                                        title: const Text('Erro'),
                                        content: const Text(
                                            'Este email já está cadastrado.'),
                                        actions: [
                                          CupertinoDialogAction(
                                            child: const Text('OK'),
                                            onPressed: () {
                                              Navigator.of(dialogContext).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                    return;
                                  }

                                  // Salva o usuário no banco de dados
                                  await LoginDatabase.instance.createUser(
                                    _emailController.text,
                                    _passwordController.text,
                                  );

                                  setState(() {
                                    _isLoading = false;
                                  });

                                  showCupertinoDialog(
                                    context: context,
                                    builder: (BuildContext dialogContext) =>
                                        CupertinoAlertDialog(
                                      title: const Text('Cadastro realizado!'),
                                      content: const Text(
                                          'Sua conta foi criada com sucesso.'),
                                      actions: [
                                        CupertinoDialogAction(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.of(dialogContext).pop();
                                            Navigator.pushReplacement(
                                              dialogContext,
                                              CupertinoPageRoute(
                                                builder: (context) =>
                                                    const ListaTelaInicial(),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              child: const Text(
                                "Cadastrar",
                                style: TextStyle(
                                  color: darkBlue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(height: 16),
                    CupertinoButton(
                      child: const Text(
                        "Já possui uma conta? Volte para o login",
                        style: TextStyle(color: Colors.white70),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const tela_login(),
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
