import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulario con Validaciones 2',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyForm(),
    );
  }
}

class MyForm extends StatelessWidget {
  const MyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormularioModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Formulario con Provider'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<FormularioModel>(
            builder: (context, formulario, child) {
              return Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nombre'),
                      onChanged: (value) {
                        formulario.nombre = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Correo electrónico'),
                      onChanged: (value) {
                        formulario.email = value;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formulario.validar()) {
                            // Procesa los datos del formulario
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Formulario enviado')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Formulario inválido')),
                            );
                          }
                        },
                        child: Text('Enviar'),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class FormularioModel with ChangeNotifier {
  String _nombre = '';
  String _email = '';

  String get nombre => _nombre;
  String get email => _email;

  set nombre(String value) {
    _nombre = value;
    notifyListeners();
  }

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  bool validar() {
    return _nombre.isNotEmpty && _email.isNotEmpty && _email.contains('@');
  }
}
