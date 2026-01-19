import 'package:flutter/material.dart';
import 'package:navegandopantallas2/column.dart';
import 'package:navegandopantallas2/row.dart';
import 'package:navegandopantallas2/rowcolumn.dart';

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

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
    body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Image(image : AssetImage("assets/ena.png")),
            SizedBox(height:20),
            Text("Escoge la Pantalla a mostrar", style : TextStyle(fontWeight: .bold, fontSize: 25)),
            Center(child: GridView.count(
              primary : false,
              padding : EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children : <Widget>[
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border:Border.all(color: const Color.fromARGB(255, 187, 133, 151), width: 5),
                      borderRadius: .all(Radius.circular(20))
                    ),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .center,
                      children: [
                        Icon(Icons.table_rows, size: 50),
                        Text("Row", style: TextStyle(fontSize: 20, fontWeight: .bold))
                      ]
                    )
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RowPage(),
                      ),
                    );
                  }
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border:Border.all(color: const Color.fromARGB(255, 187, 133, 151), width: 5),
                      borderRadius: .all(Radius.circular(20))
                    ),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .center,
                      children: [
                        Icon(Icons.view_column_sharp, size: 50),
                        Text("Column", style: TextStyle(fontSize: 20, fontWeight: .bold))
                      ]
                    )
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ColumnPage(),
                      ),
                    );
                  }
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border:Border.all(color: const Color.fromARGB(255, 187, 133, 151), width: 5),
                      borderRadius: .all(Radius.circular(20))
                    ),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .center,
                      children: [
                        Icon(Icons.table_chart, size: 50),
                        Text(
                          "Row Column", 
                          style: TextStyle(fontSize: 20, fontWeight: .bold, height:1), 
                          textAlign: .center,
                        )
                      ]
                    )
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RowColumnPage(),
                      ),
                    );
                  }
                )
              ]
            ))
          ]
        )
      )
  );
}
}