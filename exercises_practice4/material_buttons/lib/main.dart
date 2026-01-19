import 'package:flutter/material.dart';
import 'package:material_buttons/elevatedbuttons.dart';
import 'package:material_buttons/filledbuttons.dart';
import 'package:material_buttons/filledtonalbuttons.dart';
import 'package:material_buttons/outlinedbuttons.dart';
import 'package:material_buttons/textbuttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material Buttons", style: TextStyle(fontWeight: .bold)),
      ),
      body: Center(
        child: Column(
          children:[
            SizedBox(height:50),
            ElevatedButtons(),
            FilledButtons(),
            FilledTonalButtons(),
            OutlinedButtons(),
            TextButtons()
          ]
        )
      )
    );
  }
}
