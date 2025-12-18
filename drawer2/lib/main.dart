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
      title: 'Drawer 2',
      home: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  Widget _selectedWidget = Center(
    child: Text("Selecciona un Widget")
    );

  void _updateWidget(Widget widget){
    setState(() {
      _selectedWidget = widget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title : Text("Widget Básicos en Flutter"),
          actions : [
            IconButton(
              onPressed : () {
              },
              icon: Icon(Icons.settings),
            )
          ]
        ),
        body: _selectedWidget,
        drawer : Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Text("Drawer Header")),
              ListTile(
                title : Text("Texto"),
                subtitle : Text("Ejemplo de Texto"),
                leading : Icon(Icons.text_fields),
                trailing : Icon(Icons.arrow_forward),
                onTap: () {
                  _updateWidget(
                    Center(
                      child: Text(
                        "Ejemplo de Texto !",
                        style: TextStyle(
                          color: Colors.red, 
                          fontSize: 30,
                          fontWeight: .bold
                        )
                      )
                    )
                  );
                },
              ),
              ListTile(
                title : Text("Botón"),
                subtitle : Text("Ejemplo de Botón"),
                leading : Icon(Icons.smart_button),
                trailing : Icon(Icons.arrow_forward),
                onTap: () {
                  _updateWidget(
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed : () {
                              showModalBottomSheet<void>(
                                context : context,
                                builder : (BuildContext context) {
                                  return Container(
                                    height: 200,
                                    color: Colors.amber,
                                    child : Center(
                                      child: Text("You pressed the Button !")
                                    )
                                  );
                                }
                              );
                            },
                            icon: Icon(Icons.settings),
                            iconSize: 100,
                          ),
                          Text(
                            "Press me!",
                            style : TextStyle(
                              fontSize: 50
                            )
                          )
                        ]
                      )
                    ),
                  );
                },
              ),
            ]
          )
        ),
      ),
    );
  }
}
