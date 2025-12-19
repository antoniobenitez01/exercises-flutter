import 'package:flutter/material.dart';

Widget createDrawerHeader() {
 return DrawerHeader(
     margin: EdgeInsets.zero,
     padding: EdgeInsets.zero,
     child: Stack(children: <Widget>[
       Positioned(
           bottom: 12.0,
           left: 16.0,
           child: Text("Navegando Pantallas",
               style: TextStyle(
                   color: const Color.fromARGB(255, 0, 0, 0),
                   fontSize: 20.0,
                   fontWeight: FontWeight.w500))),
     ]));
}