import 'package:flutter/material.dart';
import 'package:navegandopantallas/navigationDrawer/navigation_drawer.dart';

class ContactPage extends StatelessWidget {
 static const String routeName = '/contactPage';

  const ContactPage({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
         title: Text("Contacts"),
       ),
       drawer: NewNavigationDrawer(),
       body: Center(child: Text("This is contacts page")));
 }
}