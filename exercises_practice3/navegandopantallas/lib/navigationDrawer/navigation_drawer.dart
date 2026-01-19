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
           icon: Icons.table_rows,
           text: 'Row',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes.row),
         ),
         createDrawerBodyItem(
           icon: Icons.view_column,
           text: 'Column',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes.column),
         ),

         createDrawerBodyItem(
           icon: Icons.table_chart,
           text: 'Row & Column',
           onTap: () =>
               Navigator.pushReplacementNamed(context, PageRoutes.rowcolumn),
         ),
       ],
     ),
   );
 }
}