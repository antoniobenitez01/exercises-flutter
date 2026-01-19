import 'package:flutter/material.dart';
import 'package:richtext1/richtext1.dart';
import 'package:richtext1/richtext2.dart';
import 'package:richtext1/richtext3.dart';
import 'package:richtext1/richtext4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rich Text - Practice 1',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Rich Text - Practice 1'),
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: TextStyle(fontWeight: .bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Image(image : AssetImage("assets/ena.png")),
            SizedBox(height:20),
            Text("Escoge la Pantalla a mostrar", style : TextStyle(fontWeight: .bold, fontSize: 25)),
            Center(child: GridView.count(
              primary : false,
              padding : EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children : <Widget>[
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border:Border.all(color: Theme.of(context).colorScheme.inversePrimary, width: 5),
                      borderRadius: .all(Radius.circular(20))
                    ),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .center,
                      children: [
                        Icon(Icons.text_fields, size: 50),
                        Text("RichText 1", style: TextStyle(fontSize: 20, fontWeight: .bold))
                      ]
                    )
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RichTextPage1(),
                      ),
                    );
                  }
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border:Border.all(color: Theme.of(context).colorScheme.inversePrimary, width: 5),
                      borderRadius: .all(Radius.circular(20))
                    ),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .center,
                      children: [
                        Icon(Icons.text_fields, size: 50),
                        Text("RichText 2", style: TextStyle(fontSize: 20, fontWeight: .bold))
                      ]
                    )
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RichTextPage2(),
                      ),
                    );
                  }
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border:Border.all(color: Theme.of(context).colorScheme.inversePrimary, width: 5),
                      borderRadius: .all(Radius.circular(20))
                    ),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .center,
                      children: [
                        Icon(Icons.text_fields, size: 50),
                        Text(
                          "RichText 3", 
                          style: TextStyle(fontSize: 20, fontWeight: .bold, height:1), 
                          textAlign: .center,
                        )
                      ]
                    )
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RichTextPage3(),
                      ),
                    );
                  }
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border:Border.all(color: Theme.of(context).colorScheme.inversePrimary, width: 5),
                      borderRadius: .all(Radius.circular(20))
                    ),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .center,
                      children: [
                        Icon(Icons.text_fields, size: 50),
                        Text(
                          "RichText 4", 
                          style: TextStyle(fontSize: 20, fontWeight: .bold, height:1), 
                          textAlign: .center,
                        )
                      ]
                    )
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RichTextPage4(),
                      ),
                    );
                  }
                )
              ]
            ))
          ]
        )
      )
    );
  }
}
