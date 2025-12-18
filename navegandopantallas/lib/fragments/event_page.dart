import 'package:flutter/material.dart';
import 'package:navegandopantallas/navigationDrawer/navigation_drawer.dart';

class EventPage extends StatelessWidget {
 static const String routeName = '/eventPage';

  const EventPage({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
         title: Text("Events"),
       ),
       drawer: NewNavigationDrawer(),
       body: Center(child: Text("Hey! this is events list page")));
 }
}