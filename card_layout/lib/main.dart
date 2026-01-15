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
      title: 'Cards en Filas y Columnas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CardLayoutScreen(),
    );
  }
}

class CardLayoutScreen extends StatefulWidget {
  const CardLayoutScreen({super.key});

  @override
  State<CardLayoutScreen> createState() => _CardLayoutScreenState();
}

class _CardLayoutScreenState extends State<CardLayoutScreen> {

  List<String> titles = [
    "Alarm",
    "Android",
    "Flutter",
    "Apple",
    "Windows",
    "Wallet"
  ];

  List<IconData> icons = [
    Icons.alarm,
    Icons.android,
    Icons.flutter_dash,
    Icons.apple,
    Icons.window,
    Icons.wallet
  ];

  List<MaterialColor> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.grey,
    Colors.green,
    Colors.amber
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards en Filas y Columnas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Fila con 2 Cards
              Row(
                children: [
                  Expanded(child: buildCard('Featured', Icons.star, Colors.blue)),
                  const SizedBox(width: 10),
                  Expanded(child: buildCard('Favourites', Icons.favorite, Colors.red)),
                ],
              ),
              const SizedBox(height: 12),

              // Fila con 3 Cards
              Row(
                children: [
                  Expanded(child: buildCard('Home', Icons.home, Colors.green)),
                  const SizedBox(width: 10),
                  Expanded(child: buildCard('User', Icons.person, Colors.orange)),
                  const SizedBox(width: 10),
                  Expanded(child: buildCard('Settings', Icons.settings, Colors.purple)),
                ],
              ),
              const SizedBox(height: 12),

              // Distribución automática con Wrap
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  6,
                  (index) => SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    child: buildCard(
                      titles[index],
                      icons[index],
                      colors[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Función para construir un Card personalizado
  Widget buildCard(String title, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
