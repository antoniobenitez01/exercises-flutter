
import 'package:ejercicio9/tarea.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TareasProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TareasScreen(),
    );
  }
}

class TareasScreen extends StatelessWidget {
  final TextEditingController _tarea = TextEditingController();
  final TextEditingController _descripcion = TextEditingController();

  TareasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Padding(
            padding: const .all(16),
            child: Text(
              "AÑADIR NUEVA TAREA"
            )
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Expanded(
              child: Column(
                 mainAxisSize: .min,
                children: [
                  Flexible(
                    child: TextField(
                      controller: _tarea,
                      decoration: InputDecoration(hintText: 'Tarea'),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      controller: _descripcion,
                      decoration: InputDecoration(hintText: 'Descripción'),
                    ),
                  )
                ],
              ),
            ),
          ),
          TextButton(
            child: Text(
              "AÑADIR",
              style: TextStyle(
                color: Colors.blue
              )
            ),
            onPressed: () {
              if (_tarea.text.isNotEmpty && _descripcion.text.isNotEmpty) {
                context.read<TareasProvider>().agregarTarea(_tarea.text, _descripcion.text);
                _tarea.clear();
                _descripcion.clear();
              }
            },
          ),
          Expanded(
            child: Consumer<TareasProvider>(
              builder: (context, tareasProvider, child) => ListView.builder(
                padding: .all(10),
                itemCount: tareasProvider.tareas.length,
                itemBuilder: (context, index) {
                  final tarea = tareasProvider.tareas[index];
                  return Container(
                    margin: .all(7),
                    decoration: BoxDecoration(
                      color: tarea.completada ? const Color.fromARGB(255, 196, 161, 74) : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 100, 123, 194).withValues(alpha: 0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border: .all(width: 1),
                      borderRadius: .circular(7)
                    ),
                    child: ListTile(
                      leading: 
                        Checkbox(
                          value: tarea.completada,
                          onChanged: (_) => context.read<TareasProvider>().toggleTarea(index),
                        ),
                      title: Text(
                        tarea.titulo,
                        style: TextStyle(
                          fontWeight: .bold,
                          color: tarea.completada ? const Color.fromARGB(255, 122, 122, 122) : Colors.black,
                          decoration: tarea.completada ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      subtitle: Text(
                        tarea.descripcion,
                        style: TextStyle(
                          fontSize: 12.5,
                          color: tarea.completada ? const Color.fromARGB(255, 122, 122, 122) : Colors.black,
                          decoration: tarea.completada ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      trailing: 
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => context.read<TareasProvider>().borrarTarea(index),
                        )
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}