import 'package:flutter/cupertino.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {

  const MyApp({super.key});                           
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.systemYellow,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  
  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  String? _validarUser(String? user) {
    if (user == null || user.isEmpty) {
      return 'El usuario es obligatorio';
    }
    if (user.length > 20) {
      return 'El usuario debe tener solo 20 caracteres';
    }
    return null;
  }
  
  String? _validarPassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'La contraseña es obligatoria';
    }
    if (password.length > 20 || password.length < 8) {
      return 'La contraseña debe tener entre 8 y 20 caracteres';
    }
    return null;
  }
  
  void _enviarFormulario() {
    if (_formKey.currentState!.validate()) {
      final datos = {
        'User': _userController.text,
        'Password': _passwordController.text
      };
      debugPrint('Datos $datos');
      
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Éxito'),
          content: const Text('Formulario enviado correctamente'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Login'),
        backgroundColor: CupertinoColors.systemYellow,
        border: null,
      ),
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const SizedBox(height: 20),
              CupertinoFormSection.insetGrouped(
                header: const Text('Credenciales'),
                children: [
                  CupertinoTextFormFieldRow(
                    prefix: const Text('Usuario'),
                    controller: _userController,
                    placeholder: 'Ej. Antonio Benítez',
                    validator: _validarUser,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  CupertinoTextFormFieldRow(
                    prefix: const Text('Contraseña'),
                    controller: _passwordController,
                    placeholder: 'Entre 8 y 20 caracteres',
                    obscureText: true,
                    validator: _validarPassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CupertinoButton.filled(
                  onPressed: _enviarFormulario,
                  child: const Text('Enviar'),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CupertinoButton(
                  onPressed: () {
                    _userController.clear();
                    _passwordController.clear();
                    _formKey.currentState?.reset();
                  },
                  child: const Text('Limpiar formulario'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
