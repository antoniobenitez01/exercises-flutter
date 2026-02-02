import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Inicio(),
  );
}
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Inicio')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Perfil()),
            ),
            child: Text('Ver Perfil'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Configuracion()),
            ),
            child: Text('Configuración'),
          ),
        ],
      ),
    ),
  );
}
}

class Perfil extends StatelessWidget {
  const Perfil({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Perfil')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Mi Perfil', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Volver al Inicio'),
          ),
        ],
      ),
    ),
  );
}
}

class Configuracion extends StatelessWidget {
  const Configuracion({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Configuración')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Configuración', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Volver al Inicio'),
          ),
        ],
      ),
    ),
  );
}
}