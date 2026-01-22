import 'package:ejercicio7/sunflower1.dart';
import 'package:ejercicio7/sunflower2.dart';
import 'package:ejercicio7/sunflower3.dart';
import 'package:ejercicio7/sunflower4.dart';
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
      theme: ThemeData(
        useMaterial3: true,
      ),
      home : DefaultTabController(
        length: 4,
        child: MyHomePage(title: "Sunflower Animations")
      )
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(widget.title, style: TextStyle(fontWeight: .bold, color: Colors.deepPurple)),
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.favorite_outline_sharp), text: "Flower 1"),
            Tab(icon: Icon(Icons.favorite_outline_sharp), text: "Flower 2"),
            Tab(icon: Icon(Icons.favorite_outline_sharp), text: "Flower 3"),
            Tab(icon: Icon(Icons.favorite_outline_sharp), text: "Flower 4")
          ]
        )
      ),
      body: const TabBarView(
        children: [
          SunflowerPage1(),
          SunflowerPage2(),
          SunflowerPage3(),
          SunflowerPage4()
        ]
      )
    );
  }
}
