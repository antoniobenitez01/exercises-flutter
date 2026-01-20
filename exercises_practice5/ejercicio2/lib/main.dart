import "package:ejercicio2/theme.dart";
import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final MaterialTheme customTheme = const MaterialTheme(TextTheme(
    bodyLarge: TextStyle(fontSize: 18),
    bodyMedium: TextStyle(fontSize: 16),
    bodySmall: TextStyle(fontSize: 14),
  ));

  ThemeMode _themeMode = ThemeMode.system;
  IconData _leadingIcon = Icons.light_mode;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practica 5 - Ejercicio 2',
      theme: customTheme.light(),
      darkTheme: customTheme.dark(),
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(_leadingIcon),
          title: Text("Práctica 5 - Ejercicio 2")
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text("Change the Theme !"),
              Row(
                mainAxisAlignment: .center,
                children: [
                  TextButton(
                    child: Text("Light"),
                    onPressed: () {
                      setState((){
                        _themeMode = ThemeMode.light;
                        _leadingIcon = Icons.light_mode;
                      });
                    },
                  ),
                  TextButton(
                    child: Text("Dark"),
                    onPressed: () {
                      setState((){
                        _themeMode = ThemeMode.dark;
                        _leadingIcon = Icons.dark_mode;
                      });
                    },
                  )
                ]
              )
            ]
          )
        )
      ),
    );
  }
}