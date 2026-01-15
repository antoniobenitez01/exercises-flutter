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
      title: 'Galería de Cards',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CardGalleryScreen(),
    );
  }
}

class CardGalleryScreen extends StatelessWidget {
  const CardGalleryScreen({super.key});

  // Lista de datos para las cards
  final List<Map<String, String>> items = const [
    {
      "title": "Bulbasaur",
      "subtitle": "Semilla",
      "image": "https://images.wikidexcdn.net/mwuploads/wikidex/7/74/latest/20230210210358/EP1230_Bulbasaur_de_Ash.png"
    },
    {
      "title": "Ivysaur",
      "subtitle": "Semilla",
      "image": "https://static.wikia.nocookie.net/pokemonanimeremakes/images/f/f1/Ash%27s_Ivysaur.jpg/revision/latest?cb=20241123193758"
    },
    {
      "title": "Venusaur",
      "subtitle": "Semilla",
      "image": "https://preview.redd.it/venusaur-has-been-done-so-dirty-in-za-v0-0kzda7t31zxf1.jpg?width=640&crop=smart&auto=webp&s=f0b3eeb53d19f0e0c637291935ec47f8c3cadfaf"
    },
    {
      "title": "Squirtle",
      "subtitle": "Tortuga Pequeña",
      "image": "https://static.wikia.nocookie.net/the-new-parody/images/f/f6/Squirtle_Anime.png/revision/latest?cb=20211112085107"
    },
    {
      "title": "Wartortle",
      "subtitle": "Tortuga",
      "image": "https://i.pinimg.com/236x/96/4f/05/964f051d56726b7b08974afa218f0c94.jpg"
    },
    {
      "title": "Blastoise",
      "subtitle": "Armazón",
      "image": "https://images.wikidexcdn.net/mwuploads/wikidex/8/81/latest/20210528173042/EP1157_Blastoise_de_Gary.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Galería de Cards")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Número de columnas
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8, // Relación ancho/alto
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Has pulsado: ${item['title']}")),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.network(
                        item["image"]!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 50),
                      ),
                    ),
                    ListTile(
                      title: Text(item["title"]!,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(item["subtitle"]!),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
