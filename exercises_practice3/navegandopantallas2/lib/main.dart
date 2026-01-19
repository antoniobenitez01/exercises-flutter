import 'package:flutter/material.dart';
import 'package:navegandopantallas2/pantallaprincipal.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navegando Pantallas 2',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: PantallaPrincipal(), // Pantalla inicial
  );
}
}