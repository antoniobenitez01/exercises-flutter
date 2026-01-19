import 'package:flutter/material.dart';

class WidgetHome extends StatefulWidget {
  const WidgetHome({super.key});

  @override
  State<WidgetHome> createState() => _WidgetHomeState();
}

class _WidgetHomeState extends State<WidgetHome> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children:[
          Text("WELCOME TO HOME!", style:TextStyle(fontSize: 30, fontWeight: .bold)),
          Text("Click the number below!"),
          SizedBox(height:30),
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap:(){
              _incrementCounter();
            },
            child: Ink(
              height:100,
              width: 100,
              decoration:BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(child: Text('$_counter', style: TextStyle(fontSize: 30)),)
            )
          ),
        ]
      )
    );
  }
}