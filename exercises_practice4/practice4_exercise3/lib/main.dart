import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practice 4 - Exercise 3',
      home: const MyHomePage(title: 'Practice 4 - Exercise 3'),
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
  int _selectedIndex = 0;
  double sideLength = 150;
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        leading: Padding(
          padding: .only(left: 24),
          child: Icon(
            Icons.home,
            shadows: [Shadow(color: Colors.white, offset: .new(2, 2))],
            )
        ),
        backgroundColor: Colors.amber,
        title: Text(widget.title, style: TextStyle(fontWeight: .bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          spacing: 10,
          children:[
            Container(
              width: sideLength,
              height: sideLength,
              decoration: BoxDecoration(border:Border.all(color: Colors.blueGrey)),
              child: Image(image: AssetImage("assets/ena.png")),
            ),
            Container(
              width: sideLength,
              height: sideLength,
              decoration: BoxDecoration(border:Border.all(color: Colors.blueGrey)),
              child: SvgPicture.asset("assets/android.svg", semanticsLabel: 'Android Logo'),
            ),
            Container(
              width: sideLength,
              height: sideLength,
              decoration: BoxDecoration(border:Border.all(color: Colors.blueGrey)),
              child: SvgPicture.asset("assets/yinyang.svg", semanticsLabel: 'YinYang')
            ),
          ]
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: .fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.flutter), label: ""),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.android), label: ""),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.dartLang), label: "")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
