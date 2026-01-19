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
      title: 'bottomSheetPersistent',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'bottomSheetPersistent'),
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
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Builder(
              builder : (BuildContext context) {
                return CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.indigoAccent,
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      showBottomSheet(
                        showDragHandle: true,
                        backgroundColor: Colors.blueAccent,
                        context : context,
                        builder : (context) {
                          return Center(
                            child : Column(
                              mainAxisAlignment: .center,
                              crossAxisAlignment: .center,
                              children: [
                                Image(image : AssetImage("assets/ena.png")),
                                SizedBox(height:50),
                                Text(
                                  "You pressed the Button!",
                                  style : TextStyle(
                                    color : Colors.white,
                                    fontSize: 20,
                                    fontWeight: .bold
                                  )
                                )
                              ]
                            )
                          );
                        }
                      );
                    },
                    icon : Icon(
                      Icons.open_in_browser,
                      size: 50
                      )
                  ),
                );
              }
            ),
            SizedBox(height:20),
            Text(
              "Press Me!",
              style : TextStyle(
                fontSize: 30
              )
            )
          ]
        )
      )
    );
  }
}
