import 'package:appcontabbar/widget_home.dart';
import 'package:appcontabbar/widget_message.dart';
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
        child: MyHomePage(title: "App con TabBar")
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: TextStyle(fontWeight: .bold)),
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home), text: "Home"),
            Tab(icon: Icon(Icons.message), text: "Messages"),
            Tab(icon: Icon(Icons.star), text: "Favourites"),
            Tab(icon: Icon(Icons.settings), text: "Settings")
          ]
        )
      ),
      body: const TabBarView(
        children: [
          WidgetHome(),
          WidgetMessages(),
          Center(child: Text("Favourites Content")),
          Center(child: Text("Settings Content"))
        ]
      )
    );
  }
}
