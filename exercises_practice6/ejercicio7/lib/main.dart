import 'package:flutter/material.dart'; // Importa el paquete principal de Flutter

void main() {                                                  // Punto de entrada de la aplicación
  runApp(const MyApp());                                       // Ejecuta la aplicación
}

class MyApp extends StatelessWidget {                          // Widget raíz, STATELESS
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(     
      debugShowCheckedModeBanner: false,                                   // Widget para aplicaciones Material Design
      title: 'Flutter Demo',                                   // Título de la app
      theme: ThemeData(                                        // Tema de la aplicación
        primarySwatch: Colors.blue,                            // Color primario
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'), // Pantalla principal
    );
  }
}

class MyHomePage extends StatefulWidget {                      // Widget STATEFUL para la pantalla principal
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();      // CREACIÓN DEL ESTADO (INICIALIZACIÓN, INSTANCIA LA CLASE DE ABAJO)
}

class _MyHomePageState extends State<MyHomePage> {                    // CLASE QUE MATERIALIZA EL ESTADO. Veamos atributos y métodos:
  int _counter = 0;                                                   // Contador de estado ÚNICA VARIABLE, PODRÍA HABER MÁS O UNA ESTRUCTURA DE DATOS
                                                                      // Éste es un simple contador numérico
  void _incrementCounter() {                                          // Método para incrementar el contador
    setState(() {                                                     // MODIFICA EL ESTADO LO QUE PROVOCA QUE SE REDIBUJE EL WIDGET
      _counter++;
    });
  }

  void _multiplyCounter(){
    setState(() {
      _counter = _counter * 2;
    });
  }

  void _resetCounter(){
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(                                                  // Estructura básica de la pantalla (AppBar, body, etc.)
      appBar: AppBar(                                                 // Barra superior
        title: Text(widget.title),                                    // Título de la AppBar
      ),
      body: Center(                                                   // Centra el contenido
        child: Column(                                                // Organiza widgets verticalmente
          mainAxisAlignment: MainAxisAlignment.center,                // Centra verticalmente
          children: <Widget>[                                         // Lista de widgets hijos
            const Text(
              'You have pushed the button this many times:',          // Texto estático
            ),
            Text(
              '$_counter',                                            // Muestra el valor del contador
              style: Theme.of(context).textTheme.headlineMedium,      // Estilo de texto
            ),
            Row(
              mainAxisAlignment: .center,
              children:[
                ElevatedButton(
                  onPressed: _multiplyCounter,
                  child: Text("x2")
                ),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text("Reset")
                )
              ]
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(                     // Botón flotante
        onPressed: _incrementCounter,                                 // Acción al presionar
        tooltip: 'Increment',                                         // Texto al mantener presionado
        child: const Icon(Icons.add),                                 // Icono del botón
      ),
    );
  }
}
