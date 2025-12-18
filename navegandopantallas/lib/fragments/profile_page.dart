import 'package:flutter/material.dart';
import 'package:navegandopantallas/navigationDrawer/navigation_drawer.dart';

class ProfilePage extends StatelessWidget {
 static const String routeName = '/profilePage';

  const ProfilePage({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
         title: Text("My Profile"),
       ),
       drawer: NewNavigationDrawer(),
       body: Center(child: Text("This is profile page")));
 }
}