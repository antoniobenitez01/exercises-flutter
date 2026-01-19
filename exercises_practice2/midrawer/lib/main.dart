import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Drawer',
      home: const MyHomePage(title: 'My Drawer Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: Center(
        child: Text("Hola Mundo!")
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: ListView(
          padding: EdgeInsets.only(left:20),
          children: [
            Container(
              alignment: .topLeft,
              padding: EdgeInsets.only(top: 60,left:10),
              height:230,
              color: Colors.blue,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:EdgeInsets.only(bottom:10),
                        child:CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: Text(
                            "A",
                            style: TextStyle(fontSize: 40, color: Colors.blue)
                          )
                        ),
                      ),
                      Text(
                        "Antonio Benítez", 
                        style: TextStyle(
                          fontWeight: .bold,
                          fontSize: 25,
                          color: Colors.white
                        )
                      ),
                      Text(
                        "abenrod@g.educaand.es", 
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin:EdgeInsets.only(top:50),
              height:50,
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.white),
                title: const Text(
                  "Profile",
                  style:TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )
                ),
                onTap: () {
                  Navigator.pop(context);
                }
              )
            ),
            Container(
              margin:EdgeInsets.zero,
              child: ListTile(
                leading: const Icon(Icons.message, color: Colors.white),
                title: const Text(
                  "Messages",
                  style:TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )
                ),
                onTap: () {
                  Navigator.pop(context);
                }
              )
            ),
            Container(
              margin:EdgeInsets.zero,
              child: ListTile(
                leading: const Icon(Icons.bookmark, color: Colors.white),
                title: const Text(
                  "Bookmarks",
                  style:TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )
                ),
                onTap: () {
                  Navigator.pop(context);
                }
              )
            ),
            Container(
              margin:EdgeInsets.zero,
              child: ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text(
                  "Settings",
                  style:TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )
                ),
                onTap: () {
                  Navigator.pop(context);
                }
              )
            ),
            Container(
              margin:EdgeInsets.zero,
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text(
                  "Logout",
                  style:TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )
                ),
                onTap: () {
                  Navigator.pop(context);
                }
              )
            ),
          ],
        ),
      ),
    );
  }
}
