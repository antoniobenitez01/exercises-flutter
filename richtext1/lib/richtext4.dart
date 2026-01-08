import 'package:flutter/material.dart';


class RichTextPage4 extends StatelessWidget {
 static const String routeName = '/richtextpage4';

  const RichTextPage4({super.key});

  @override
 Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("RichText 4", style: TextStyle(fontWeight: .bold)),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: 'Courier',
                backgroundColor: Colors.grey[100],
              ),
              children: [
                TextSpan(
                  text: "void ",
                  style: TextStyle(color: Colors.blue),
                ),
                TextSpan(
                  text: "main",
                  style: TextStyle(color: Colors.purple),
                ),
                TextSpan(
                  text: "() {\n  ",
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: "print",
                  style: TextStyle(color: Colors.blue),
                ),
                TextSpan(
                  text: "('Hello, Flutter!');\n}",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          )
        )
      ));
 }
}