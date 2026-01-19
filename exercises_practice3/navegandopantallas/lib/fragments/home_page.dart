import 'package:flutter/material.dart';
import 'package:navegandopantallas/navigationDrawer/navigation_drawer.dart';

class HomePage extends StatelessWidget {
 static const String routeName = '/home_page';

  const HomePage({super.key});

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
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Image(image : AssetImage("assets/ena.png")),
            SizedBox(height:20),
            Text("This is the Home Page!", style : TextStyle(fontWeight: .bold, fontSize: 25)),
            Text("Please, open the Header on the \ntop left corner to see more pages", textAlign: .center,)
          ]
        )
      )
    );
 }
}