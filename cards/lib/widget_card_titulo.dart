import 'package:flutter/material.dart';

class CardTituloWidget extends StatelessWidget{
  const CardTituloWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
     elevation: 5,
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
     child: Column(
       children: <Widget>[
         ListTile(
          // leading: Icon(Icons.photo_album, color: Colors.blue),
           title: Text("Card con Título"),
           subtitle: Text(
               "¿ Qué conspiraciones tenemos hoy en el menú ?"),
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[
            TextButton(
              child: Text("Ok"),
              onPressed: () {}
            ),
            TextButton(
              child: Text("Cancelar"),
              onPressed: () {}
            )
           ],
         )
       ],
     ),
   );
  }
}