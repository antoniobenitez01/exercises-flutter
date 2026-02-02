import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegación entre Pantallas 2',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Navegación entre Pantallas 2"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child:
          ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PantallaConDatos(
                  nombre: 'Juan',
                  edad: 25,
                ),
              ),
            );
          },
          child: Text('Enviar Datos'),
          )
      )
    );
  }
}

class PantallaConDatos extends StatelessWidget {
final String nombre;
final int edad;

const PantallaConDatos({super.key, required this.nombre, required this.edad});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Datos Recibidos')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Nombre: $nombre', style: TextStyle(fontSize: 20)),
          Text('Edad: $edad años', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Volver'),
          ),
        ],
      ),
    ),
  );
}
}
