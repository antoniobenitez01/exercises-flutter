import 'package:flutter/material.dart';
import 'package:navegandopantallas/navigationDrawer/navigation_drawer.dart';

class HomePage extends StatelessWidget {
 static const String routeName = '/homePage';

  const HomePage({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
         title: Text("Home"),
       ),
       drawer: NewNavigationDrawer(),
              body: Center(child: Text("This is home page")));
 }
}