import 'package:flutter/material.dart';
import 'package:navegandopantallas/fragments/column.dart';
import 'package:navegandopantallas/fragments/home_page.dart';
import 'package:navegandopantallas/fragments/row.dart';
import 'package:navegandopantallas/fragments/rowcolumn.dart';
import 'package:navegandopantallas/routes/page_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 // This widget is the root of your application.
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
     title: 'NavigationDrawer Demo',
     theme: ThemeData(
       primarySwatch: Colors.blue,
     ),
     home: HomePage(),
     routes:  {
       PageRoutes.home: (context) => HomePage(),
       PageRoutes.row: (context) => RowPage(),
       PageRoutes.column: (context) => ColumnPage(),
       PageRoutes.rowcolumn: (context) => RowColumnPage(),
     },
   );
 }
}