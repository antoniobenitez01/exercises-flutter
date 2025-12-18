import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column 1',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Column 1'),
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
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: Text(
          widget.title,
          style : TextStyle(
            color : Colors.white,
            fontWeight: .bold
          )
        ),
      ),
      body : Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.blue,
                child: Text("Item 1")
              )
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.green,
                child: Text("Item 2")
              )
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.yellow,
                child: Text("Item 3")
              )
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.red,
                child: Text("Item 4")
              )
            ),
          ]
        )
      )
    );
  }
}
