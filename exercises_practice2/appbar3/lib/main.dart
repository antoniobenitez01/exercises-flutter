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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter(){
    setState((){
      _counter = 0;
    });
  }

  Future<void> _showDialog() async{
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('WARNING !'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Have a wonderful day!")
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("OK!"),
              onPressed: (){
                Navigator.of(context).pop();
              }
            )
          ]
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar - Exercise 3"),
        
        //<Widget>[]
        actions: <Widget>[
          
          //IconButton
          IconButton(
            icon: const Icon(Icons.comment),
            tooltip: 'Comment Icon',
            onPressed: () {
              showModalBottomSheet<void>(
                context: context, 
                builder: (BuildContext context){
                  return Container(
                    height: 100,
                    color : const Color.fromARGB(255, 7, 143, 255),
                    child: Center(
                      child: Text("YOU'VE CLICKED THE COMMENT BUTTON!",
                      style:TextStyle(color:Colors.white))
                    )
                  );
                });
            },
          ), 
          
          //IconButton
          IconButton(
            icon: const Icon(Icons.loop),
            tooltip: 'Reset Button',
            onPressed: () {
              _resetCounter();
            },
          ), 
        ], 
        backgroundColor: const Color.fromARGB(255, 0, 230, 219),
        foregroundColor: Colors.white,
        elevation: 50.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () {
            _showDialog();
          },
        ),
        systemOverlayStyle: .light,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
