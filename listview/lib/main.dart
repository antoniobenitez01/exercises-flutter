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
      title: 'ListView',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'ListView Exercise'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> titles = ["List 1","List 2","List 3"];
  final subtitles = [
    "List 1 Subtitle",
    "List 2 Subtitle",
    "List 3 Subtitle"
  ];
  final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: Text("ListView Exercise", style: TextStyle(
          color: Colors.white, 
          fontWeight: .bold))
      ),
      body: ListView.builder(
        itemCount : titles.length,
        itemBuilder : (context, index) {
          return Card(
            child: ListTile(
              onTap : () {
                setState(() {
                  titles.add('List ${titles.length + 1}');
                  subtitles.add('List ${titles.length + 1} Subtitle');
                  icons.add(Icons.zoom_out_sharp);
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content : Text("${titles[index]} pressed !"),
                ));
              },
              title : Text(titles[index]),
              subtitle : Text(subtitles[index]),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/ena.webp")
              ),
              trailing: Icon(icons[index])
            )
          );
        }
      )
    );
  }
}
