import 'package:flutter/material.dart';

class RowPage extends StatelessWidget {
 static const String routeName = '/rowpage';

  const RowPage({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: Text(
          "Navegando Pantallas 2",
          style : TextStyle(
            color : Colors.white,
            fontWeight: .bold
          )
        ),
      ),
      body: Center(
        child: Row(
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
      ) 
  );
 }
}