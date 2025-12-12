import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        title: Text("Drawer - Exercise 1"),
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 255, 84, 155)
      ),
      body: const Center(
        child: Text(
          'A drawer is an invisible side screen.',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            SizedBox(
              height:215,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 175, 76, 117),
                ), // BoxDecoration
                child: UserAccountsDrawerHeader(
                  margin:EdgeInsets.only(top:0,bottom:10),
                  decoration: BoxDecoration(color: Color.fromARGB(255, 175, 76, 117)),
                  accountName: Text(
                    "Antonio Benítez",
                    style: TextStyle(fontSize: 18, fontWeight: .bold),
                  ),
                  accountEmail: Text("abenrod@g.educaand.es"),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 224, 137),
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 30.0, color: Colors.blue),
                    ), // Text
                  ), // CircleAvatar
                ), // UserAccountDrawerHeader
              ),
            ), // DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ), // Drawer
    );
  }
}
