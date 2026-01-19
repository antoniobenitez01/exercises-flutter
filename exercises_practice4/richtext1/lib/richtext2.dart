import 'package:flutter/material.dart';


class RichTextPage2 extends StatelessWidget {
 static const String routeName = '/richtextpage2';

  const RichTextPage2({super.key});

  @override
 Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("RichText 2", style: TextStyle(fontWeight: .bold)),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 18),
              children: [
                TextSpan(text: "Price:  ", style:TextStyle(color:Colors.black)),
                TextSpan(
                  text: "\$99.99",
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                TextSpan(text: " "),
                TextSpan(
                  text: "\$49.99",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          )
        )
      ));
 }
}