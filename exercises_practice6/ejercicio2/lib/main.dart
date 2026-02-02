import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegación entre Pantallas',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Pantalla Principal'),
      backgroundColor: Colors.blue,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '¡Bienvenido!',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navegar a la segunda pantalla
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SegundaPantalla(),
                ),
              );
            },
            child: Text('Ir a Segunda Pantalla'),
          ),
        ],
      ),
    ),
  );
}
}

class SegundaPantalla extends StatelessWidget {
  const SegundaPantalla({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Segunda Pantalla'),
      backgroundColor: Colors.green,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '¡Estás en la segunda pantalla!',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Volver a la pantalla anterior
              Navigator.pop(context);
            },
            child: Text('Volver Atrás'),
          ),
        ],
      ),
    ),
  );
}
}
