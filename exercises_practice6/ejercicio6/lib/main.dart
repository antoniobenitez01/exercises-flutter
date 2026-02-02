import 'package:flutter/material.dart';
void main() {
 runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       primarySwatch: Colors.green,
     ),
     title: 'GestureDetector Example',
     home: GestureExample(),
   );
 }
}
class GestureExample extends StatelessWidget {
  const GestureExample({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('GestureDetector Example'),
     ),
     body: Center(
       child: InkWell(
         onTap: () {
           Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SwipeGestureExample(),
              ),
            );
         },
         child: const Padding(
            padding: EdgeInsets.all(20),
            child: Text("Cambia de página"),
          )
       ),
     ),
   );
 }
}

class SwipeGestureExample extends StatefulWidget {
  const SwipeGestureExample({super.key});

 @override
 SwipeGestureExampleState createState() => SwipeGestureExampleState();
}

class SwipeGestureExampleState extends State<SwipeGestureExample> {
 Color _backgroundColor = Colors.blue;
 void _changeColorOnSwipe(DragUpdateDetails details) {
   if (details.delta.dx > 0) {
     setState(() {
       _backgroundColor = Colors.green;
     });
   } else if (details.delta.dx < 0) {
     setState(() {
       _backgroundColor = Colors.red;
     });
   }
 }
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Swipe GestureDetector Example'),
     ),
     body: Center(
       child: Column(
        mainAxisAlignment: .center,
         children: [
           GestureDetector(
             onHorizontalDragUpdate: _changeColorOnSwipe,
             child: Container(
               width: 200,
               height: 200,
               color: _backgroundColor,
               child: Center(
                 child: 
                  Text(
                    'Swipe me!',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
               ),
             ),
           ),
           SizedBox(height:20),
           InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Text("Cambia de página"),
            )
          ),
         ],
       ),
     ),
   );
 }
}