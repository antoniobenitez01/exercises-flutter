import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  const MyApp({super.key});                           
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _formKey = GlobalKey<FormState>();

  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validarUser(String? user){
    if( user == null || user.isEmpty){
      return 'El usuario es obligatorio';
    }
    if( user.length > 20 ){
      return 'El usuario debe tener solo 20 caracteres';
    }
    return null;
  }

  String? _validarPassword(String? password){
    if( password == null || password.isEmpty){
      return 'La contraseña es obligatoria';
    }
    if( password.length > 20 || password.length < 8 ){
      return 'La contraseña debe tener entre 8 y 20 caracteres';
    }
    return null;
  }

  void _enviarFormulario(){
    if(_formKey.currentState!.validate()) {
      final datos = {
        'User' : _userController.text,
        'Password' : _passwordController.text
      };
      debugPrint('Datos $datos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Colors.amber,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(                                              //aquí comienza el formulario
            key: _formKey,                                          // se asocia la GlobalKey al formulario
            autovalidateMode: AutovalidateMode.onUserInteraction,   // se indica la autovalidación
            onChanged: () {                                         // gesture detectada --> mensaje que se muestra a modo confirmación
              debugPrint("Formulario modificado"); 
            },
            child: Column(                                         // se organiza el contenido en una columna vertical
              children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: _userController,                                   // el formulario tiene un único campo, un widget TextFormField
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    border : OutlineInputBorder(),
                    hintText: 'Ej. Antonio Benítez',
                  ),
                  validator: _validarUser
                ),
                SizedBox(height: 15),
                TextFormField(      
                  controller: _passwordController,                               // el formulario tiene un único campo, un widget TextFormField
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                    hintText: "Entre 10 y 20 caracteres",
                  ),
                  obscureText: true,
                  validator: _validarPassword,
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    _enviarFormulario();                                       // no envía datos a ningún sitio...Por ahora, nada más
                  },
                  child: Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
