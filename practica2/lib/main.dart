import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// ROOT
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme : TextTheme(
          bodyMedium: const TextStyle(
            fontFamily: 'Lexend',
            color : Colors.white
          ),
          bodyLarge : const TextStyle(
            fontFamily: 'Gabarito',
            fontSize: 75,
            color : Colors.white
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 236, 47, 104),
        ),
        listTileTheme: ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: const Color.fromARGB(255, 155, 57, 0),
              width:2
            ),
            borderRadius: BorderRadius.circular(8)
          ),
          titleTextStyle: TextStyle(
            fontSize: 30,
            color: Colors.black
          )
        ),
      ),
      home: const MyHomePage(title: 'Práctica 2 - Ejercicio 1'),
    );
  }
}
// HOME PAGE
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
// HOME PAGE STATE
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;

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

  void _setCounter(int value){
    setState((){
      _counter = value;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0){
        _resetCounter();
      }else if (index == 1) {
        _incrementCounter();
      }else if (index == 2){
        _setCounter(_counter + 100);
      }
    });
  }

  // CONTEXT
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- APPBAR
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 210, 112),
        title: Text(widget.title,
        style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      drawer : SizedBox(
        width:275,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children : [
              SizedBox(
                height:100,
                child: DrawerHeader(
                  decoration: BoxDecoration(color : Colors.amber),
                  padding: EdgeInsets.only(bottom:10,right:30,left:20,top:20),
                  child: Text(
                    "Práctica 2",
                    softWrap: true,
                    style: TextStyle(fontSize: 30))
                ),
              ),
              Container(
                alignment: .center,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListTile(
                  title: Center(child:const Text('Reset Counter')),
                  onTap: () {
                    _resetCounter();
                    Navigator.pop(context);
                  }
                )
              ),
              Container(
                alignment: .center,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListTile(
                  title: Center(child:const Text('Counter to 100')),
                  onTap: () {
                    _setCounter(100);
                    Navigator.pop(context);
                  }
                )
              ),
              Container(
                alignment: .center,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListTile(
                  title: Center(child:const Text('Counter to 500')),
                  onTap: () {
                    _setCounter(500);
                    Navigator.pop(context);
                  }
                )
              )
            ]
          )
        ),
      ),
      // --- BODY
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purpleAccent, Colors.orangeAccent],
            begin:Alignment.bottomLeft,
            end:Alignment.topRight
          )
        ),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: const Image(image: AssetImage('assets/images/ena.png'),width:100),
            ),
            Text('You have pushed the button this many times:', style: Theme.of(context).textTheme.bodyMedium),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: const Image(image: AssetImage('assets/images/ena.png'),width:100),
            )
          ],
        ),
      ),
      /*floatingActionButtonLocation: .centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add_box_outlined, color:Colors.white),
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.loop), label: 'Reset'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: '+100')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
      ),
    );
  }
}
