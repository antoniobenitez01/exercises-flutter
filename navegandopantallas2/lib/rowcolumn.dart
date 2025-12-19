import 'package:flutter/material.dart';

class RowColumnPage extends StatelessWidget {
 static const String routeName = '/rowcolumnpage';

  const RowColumnPage({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: Text(
          "Navegando Pantallas 2",
          style : TextStyle(
            color : Colors.white,
            fontWeight: .bold
          )
        ),
    ),
      body: Column(children: <Widget>[
            parchisWidget(context),
          ],));
 }
}

Widget parchisWidget(BuildContext context){

  const double size1 = 20;
  const double size2 = 25;

  return Expanded(
    child: Column(children: <Widget>[
      Expanded(
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: .center,
            children: [
              Text("Parchis Colors:",
              style: TextStyle(
                fontSize : size1,
                fontWeight: .bold
              )),
            ]))),
      Expanded(
        child: Row(children: <Widget>[
          Expanded(
              child: Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                    "Red Color",
                    style: TextStyle(
                      fontSize: size2
                    )
                  ),
                )
              )
            ),
            Expanded(
              child: Container(
                color: Colors.yellow,
                child: Center(
                  child: Text(
                    "Yellow Color",
                    style: TextStyle(
                      fontSize: size2
                    )
                  ),
                )
              )
            ),
          ]
        )
      ),
      Expanded(
        child: Row(children: <Widget>[
          Expanded(
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Text(
                    "Green Color",
                    style: TextStyle(
                      fontSize: size2
                    )
                  ),
                )
              )
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    "Blue Color",
                    style: TextStyle(
                      fontSize: size2
                    )
                  ),
                )
              )
            ),
        ])
      ),
      Expanded(
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: .center,
            children: [
              Text("What's your favourite color?",
              style: TextStyle(
                fontSize : size1,
                fontWeight: .bold
              )),
            ]))),
    ],)
  );
}