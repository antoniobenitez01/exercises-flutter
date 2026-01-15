import 'package:flutter/material.dart';

class CardCompletoWidget extends StatelessWidget{
  const CardCompletoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black54,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset('assets/image1.webp'),
            SizedBox(height: 12),
            Text("Card Completo !"),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context, 
                  builder: (BuildContext context) {
                    return Container(
                      padding: .all(30),
                      height:  350,
                      decoration: BoxDecoration(
                        color: Colors.amber
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: .center,
                          crossAxisAlignment: .center,
                          children: [
                            Image(image: AssetImage("assets/ena.png")),
                            SizedBox(height:20),
                            Text("It's ENA ! No way !", style: TextStyle(
                              fontWeight: .bold,
                              color: Colors.deepPurple,
                              fontSize: 30))
                          ]
                        )
                      )
                    );    
                  }
                );
              },
              child: Text("Press me !"),
            )
          ],
        ),
      ),
      );
  }
}