import 'package:flutter/material.dart';
import 'package:navegandopantallas/routes/page_route.dart';
import 'package:navegandopantallas/widgets/create_drawer_body_item.dart';
import 'package:navegandopantallas/widgets/create_drawer_header.dart';

class NewNavigationDrawer extends StatelessWidget {
  const NewNavigationDrawer({super.key});

 @override
 Widget build(BuildContext context) {
   return Drawer(
     child: ListView(
       padding: EdgeInsets.zero,
       children: <Widget>[
         createDrawerHeader(),
         createDrawerBodyItem(
           icon: Icons.home,
           text: 'Home',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes.home),
         ),
         createDrawerBodyItem(
           icon: Icons.account_circle,
           text: 'Profile',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes.profile),
         ),

         createDrawerBodyItem(
           icon: Icons.event_note,
           text: 'Events',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes.event),
         ),
         Divider(),
         createDrawerBodyItem(
           icon: Icons.notifications_active,
           text: 'Notifications',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes.notification),
         ),
         createDrawerBodyItem(
           icon: Icons.contact_phone,
           text: 'Contact Info',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes.contact),
         ),
         ListTile(
           title: Text('App version 1.0.0'),
           onTap: () {},
         ),
       ],
     ),
   );
 }
}