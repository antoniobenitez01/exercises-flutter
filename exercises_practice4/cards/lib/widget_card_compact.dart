import 'package:flutter/material.dart';

class CompactCardWidget extends StatelessWidget{
  const CompactCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
       clipBehavior: Clip.antiAlias,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
       child: Column(
         children: <Widget>[
           Image.asset('assets/image1.webp'),
           Container(
             padding: EdgeInsets.all(10),
             child: Text("Card Compacto ! "),
           )
         ],
    ));
  }
}