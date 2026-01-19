import 'package:cards/widget_card_completo.dart';
import 'package:cards/widget_card_titulo.dart';
import 'package:cards/widget_card_compact.dart';
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
      title: 'Cards Exercise',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Cards Exercise'),
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
        title: Text(widget.title),
      ),
      body: Container(
        padding: .all(15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 84, 97, 172),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height:30),
              CardCompletoWidget(),
              CardTituloWidget(),
              CompactCardWidget(),
              Card.filled(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("Filled Card"),
                ),
              ),
              Card.outlined(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("Outlined Card"),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("Tócame"),
                  ),
                ),
              ),
              SizedBox(height:30)
            ]
          )
        )
      )
    );
  }
}
