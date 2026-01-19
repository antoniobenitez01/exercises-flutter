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
      title: 'bottomSheetModal',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'bottomSheetModal'),
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
        backgroundColor: Colors.amber,
        title: Text(widget.title),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.amber,
              child: IconButton(
                color: Colors.white,
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.indigoAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: .vertical(top: Radius.circular(20))
                    ),
                    isScrollControlled: false,
                    context : context,
                    builder : (BuildContext context){
                      return Center(
                        heightFactor: 5,
                        child: Text(
                          "You pressed the Button!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          )
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
            ),
            SizedBox(height:20),
            Text(
              "Press Me!",
              style : TextStyle(
                fontSize: 20
              )
            )
          ]
        )
      )
    );
  }
}
