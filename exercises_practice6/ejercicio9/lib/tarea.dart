import 'package:flutter/material.dart';

class Tarea {
  final String titulo;
  final String descripcion;
  bool completada;

  Tarea(this.titulo, this.descripcion, {this.completada = false});
}

class TareasProvider with ChangeNotifier {
  final List<Tarea> _tareas = [];

  List<Tarea> get tareas => _tareas;

  void agregarTarea(String titulo, String descripcion) {
    _tareas.add(Tarea(titulo, descripcion));
    notifyListeners();
  }

  void toggleTarea(int index) {
    _tareas[index].completada = !_tareas[index].completada;
    notifyListeners();
  }
  
  void borrarTarea(int index){
    _tareas.removeAt(index);
    notifyListeners();
  }
}