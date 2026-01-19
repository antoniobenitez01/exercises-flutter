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
      title: 'My App Bar',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title : 'My App Bar'),
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
         child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height:120,
              child:DrawerHeader(
                decoration: BoxDecoration(color: Color.fromARGB(255, 255, 119, 7)),
                child: Text("MENU",
                  style:TextStyle(
                    color:Colors.white,
                    fontWeight: .bold,
                    fontSize: 50
                  )
                )
              )
            ),
            Container(
              margin:EdgeInsets.only(top:10,bottom:20,left:20,right:20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 183, 29),
                borderRadius:BorderRadius.circular(10)
              ),
              child:ListTile(
                title : const Text("Reset Counter",
                  style: TextStyle(
                    fontWeight: .bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20
                  )
                ),
                onTap: (){
                  _resetCounter();
                  Navigator.pop(context);
                }
              )
            )
          ]
         )
      ),
      appBar: AppBar(
        title: const Text("My App Bar",
          style: TextStyle(
            fontWeight: .bold
          )
        ),
        
        //<Widget>[]
        actions: <Widget>[
          
          //IconButton
          IconButton(
            icon: const Icon(Icons.question_mark),
            tooltip: 'ENA Button',
            onPressed: () {
              showModalBottomSheet<void>(
                context: context, 
                builder: (BuildContext context){
                  return Container(
                    height:350,
                    padding:EdgeInsets.all(50),
                    color:Color.fromARGB(255, 255, 219, 15),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: .center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: Image(image : AssetImage('assets/ena.png'))
                          ),
                          Text("You found ENA! Nice!",
                            style:TextStyle(
                              color: const Color.fromARGB(255, 0, 17, 167),
                              fontWeight: .bold,
                              fontSize: 30,
                            )
                          )
                        ]
                      )
                    )
                  );
                });
            },
          ),  
        ], 
        backgroundColor: const Color.fromARGB(255, 255, 55, 132),
        foregroundColor: Colors.white,
        elevation: 50.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
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
