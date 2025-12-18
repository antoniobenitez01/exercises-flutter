import 'package:flutter/material.dart';
import 'package:navegandopantallas/navigationDrawer/navigation_drawer.dart';

class NotificationPage extends StatelessWidget {
 static const String routeName = '/notificationPage';

  const NotificationPage({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
         title: Text("Notifications"),
       ),
       drawer: NewNavigationDrawer(),
       body: Center(child: Text("This is notification page")));
 }
}