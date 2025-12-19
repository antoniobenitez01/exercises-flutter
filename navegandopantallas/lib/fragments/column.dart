import 'package:flutter/material.dart';
import 'package:navegandopantallas/navigationDrawer/navigation_drawer.dart';

class ColumnPage extends StatelessWidget {
 static const String routeName = '/columnpage';

  const ColumnPage({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: Text(
          "Navegando Pantallas",
          style : TextStyle(
            color : Colors.white,
            fontWeight: .bold
          )
        ),
      ),
      drawer: NewNavigationDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.blue,
                child: Text("Item 1")
              )
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.green,
                child: Text("Item 2")
              )
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.yellow,
                child: Text("Item 3")
              )
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.red,
                child: Text("Item 4")
              )
            ),
          ]
        )
      ));
 }
}