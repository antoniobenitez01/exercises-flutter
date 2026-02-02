import 'package:flutter/material.dart';

final imagenLaptop = "https://www.itaf.eu/wp-content/uploads/2021/01/Best-laptops-in-2021-7-things-to-consider-when-buying-a-laptop.jpg";
final imagenComputer = "https://upload.wikimedia.org/wikipedia/commons/0/04/MSI-Gaming-PC_2024-09-30.png";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigator Example',
      home: const HomeScreen(),                     // la visualización comienza con la página HomeScreen
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation', style: TextStyle(fontWeight: .bold)),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Card(
                elevation: 30,
                shadowColor: Colors.black,
                child: SizedBox(
                  width:300,
                  height: 300,
                  child: Padding(
                    padding: .all(20),
                    child: Column(
                      children:[
                        Image.network(
                          imagenComputer,
                          height: 150,
                          width: 300,
                          fit: .fill,
                        ),
                        SizedBox(height:10),
                        Text("COMPUTERS", style: TextStyle(
                          fontSize: 30,
                          fontWeight: .bold
                        )),
                        ElevatedButton(                
                          onPressed: () {                         
                            Navigator.push(                            
                              context,
                              MaterialPageRoute(builder: (context) => const ComputersScreen()),    
                            );
                          },
                          child: const Text('More about COMPUTERS'),
                        ),
                      ]
                    )
                  )
                )
              ),
              Card(
                elevation: 30,
                shadowColor: Colors.black,
                child: SizedBox(
                  width:300,
                  height: 300,
                  child: Padding(
                    padding: .all(20),
                    child: Column(
                      children:[
                        Image.network(
                          imagenLaptop,
                          height: 150,
                          width: 300,
                          fit: .fill,
                        ),
                        SizedBox(height:10),
                        Text("LAPTOPS", style: TextStyle(
                          fontSize: 30,
                          fontWeight: .bold
                        )),
                        SizedBox(height:5),
                        ElevatedButton(                
                          onPressed: () {                         
                            Navigator.push(                            
                              context,
                              MaterialPageRoute(builder: (context) => const LaptopsScreen()),    
                            );
                          },
                          child: const Text('More about LAPTOPS'),
                        ),
                      ]
                    )
                  )
                )
              )
            ],
          ),
        )
      ),
    );
  }
}

class ComputersScreen extends StatelessWidget {    
  const ComputersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Computers', style: TextStyle(fontWeight: .bold)),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Image.network(
              imagenComputer,
              height: 200,
              width: 300,
              fit: .fill,
            ),
            SizedBox(height:10),
            Text("COMPUTERS ARE COOL !", style: TextStyle(
              fontSize: 30,
              fontWeight: .bold
            )),
            SizedBox(height:5),
            ElevatedButton(
              onPressed: () {                     
                Navigator.pop(context);            
              },
              child: const Text('Go Back'),
            ),
          ]
        )
      ),
    );
  }
}

class LaptopsScreen extends StatelessWidget {
  const LaptopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laptops', style: TextStyle(fontWeight: .bold)),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Image.network(
              imagenLaptop,
              height: 200,
              width: 300,
              fit: .fill,
            ),
            SizedBox(height:10),
            Text("LAPTOPS ARE COOL !", style: TextStyle(
              fontSize: 30,
              fontWeight: .bold
            )),
            SizedBox(height:5),
            ElevatedButton(
              onPressed: () {                       
                Navigator.pop(context);                   
              },
              child: const Text('Go Back'),
            ),
          ]
        )
      ),
    );
  }
}
