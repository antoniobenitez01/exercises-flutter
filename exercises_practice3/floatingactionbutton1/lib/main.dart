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
      title: 'floatingActionButton 1',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'floatingActionButton 1'),
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

  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _setCounter(int counter){
    setState(() {
      _counter = counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title : Text("Floating Action Button 1"),
        centerTitle: true,
        backgroundColor: Colors.amber
      ),
      body : Center(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$_counter',
              style : TextStyle(
                fontSize: 50
              )
            ),
            Text(
              "Times pressed",
              style: TextStyle(
                fontSize: 20
              )
            )
          ]
        )
      ),
      floatingActionButtonLocation: .centerDocked,
      floatingActionButton: FloatingActionButton(
        shape : CircleBorder(),
        backgroundColor : Colors.red,
        tooltip: "Increment",
        onPressed : () {
          _increment();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30
        )
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.amber,
        shape : CircularNotchedRectangle(),
        child : Row(
          mainAxisAlignment: .spaceAround,
          children: [
            IconButton(
              onPressed : () {
                _setCounter(0);
              },
              icon : Icon(Icons.home, color: Colors.white)
            ),
            IconButton(
              onPressed : () {
                _setCounter(_counter + 10);
              },
              icon : Icon(Icons.favorite, color: Colors.white)
            )
          ]
        )
      ),
    );
  }
}
