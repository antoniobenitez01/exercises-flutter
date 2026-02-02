import 'package:flutter/material.dart';
import 'package:provider/provider.dart';                           // OJO: Importación necesaria para usar la gestión de estados

void main() {
  runApp(
    // Envolvemos toda la aplicación en un ChangeNotifierProvider (VER ABAJO)
    // Esto permite que cualquier widget descendiente tenga acceso al modelo CounterModel 
    ChangeNotifierProvider(
      create: (_) => CounterModel(),                              // Inicializa la instancia del modelo, aquí denominado CounterModel
      child: MyApp(),
    ),
  );
}

// Clase que contiene la lógica de negocio y el estado
// Hereda de ChangeNotifier para poder notificar cambios a la UI
class CounterModel extends ChangeNotifier {                       // ChangeNotifier (VER ABAJO)
  int _count = 0;                                                 // Contador privado del modelo
  
  // Getter para acceder al valor desde fuera de la clase, ya que es privado
  int get count => _count;

  // Método para modificar el estado
  void increment() {
    _count++;
    // Crucial: Informa a todos los widgets que están "escuchando" que deben redibujarse (VER ABAJO)
    notifyListeners();
  }

  void multiply(){
    _count *= 2;
    notifyListeners();
  }

  void reset(){
    _count = 0;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Configuración básica de la aplicación con Material Design, nada cambia
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // context.watch se usa para escuchar cambios. 
    // Si notifyListeners() es llamado, este widget se reconstruye automáticamente.
    final counter = context.watch<CounterModel>();                   // atención a watch (VER ABAJO)

    return Scaffold(
      appBar: AppBar(title: Text('Provider Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              'Count: ${counter.count}',                                // Accedemos al valor actual del contador
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: .center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<CounterModel>().multiply(), 
                  child: Text("x2")
                ),
                ElevatedButton(
                  onPressed: () => context.read<CounterModel>().reset(), 
                  child: Text("Reset")
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // context.read se usa para acceder a métodos sin "escuchar" cambios de UI.
        // Es ideal para funciones de botones (onPressed) para mejorar el rendimiento.
        onPressed: () => context.read<CounterModel>().increment(),  // Atención a read VER ABAJO
        child: Icon(Icons.add),
      ),
    );
  }
}
