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
      title: 'Stack',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Stack Exercise'),
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
        backgroundColor: Colors.indigo,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: .bold
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Center(
            child: Stack(
              fit: .expand,
              clipBehavior: .antiAliasWithSaveLayer,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 300,
                  color: Colors.red
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.purple
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 80,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.black,
                    child: Image(image: AssetImage("assets/ena.png"))
                  ),
                ),
              ]
            )
          )
        )
      )
    );
  }
}
