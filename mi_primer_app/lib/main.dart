import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Reto',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _contador = 0;

  void _mostrarMensaje() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Has perdido El Juego.'), duration: Duration(seconds: 2)),
    );
  }

  void _incrementarContador() {
    setState(() {
      _contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Reto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador: $_contador', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _mostrarMensaje,
              child: Text('Mostrar Mensaje', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _incrementarContador,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 0, 157),
                foregroundColor: Colors.white,
              ),
              child: Text('Incrementar', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}