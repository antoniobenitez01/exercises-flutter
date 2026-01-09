import 'package:flutter/material.dart';

class WidgetFavourites extends StatefulWidget {
  const WidgetFavourites({super.key});

  @override
  State<WidgetFavourites> createState() => _WidgetFavouritesState();
}

class _WidgetFavouritesState extends State<WidgetFavourites> {

  bool _isVisible = false;

  void toggleVisibility(){
    setState((){
      _isVisible ? _isVisible = false : _isVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Container(
              height: 70,
              width:  350,
              margin:.all(5),
              padding: .all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 110, 92, 126),
                borderRadius: .all(.circular(5))
              ),
              child: Row(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  Icon(Icons.star, color: Colors.white),
                  SizedBox(width:10),
                  Text("FAVOURITE BUTTONS",style: TextStyle(
                    fontWeight: .bold,
                    color: Colors.white,
                    fontSize: 20
                  )),
                  SizedBox(width:10),
                  Icon(Icons.star, color: Colors.white),
                ]
              )
            ),
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
                      border:Border.all(color: const Color.fromARGB(255, 110, 92, 126), width: 5),
                      borderRadius: .all(Radius.circular(20))
                    ),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .center,
                      children: [
                        Icon(Icons.present_to_all, size: 50),
                        Text("BUTTON 1", style: TextStyle(fontSize: 15, fontWeight: .bold))
                      ]
                    )
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: .all(.circular(10))
                          ),
                          padding: .all(50),
                          width: 400,
                          height: 350,
                          child:Column(
                            children:[
                              Image(image: AssetImage("assets/ena.png")),
                              SizedBox(height: 30),
                              Text("You found ENA ! Hurray !", style: TextStyle(
                                color: const Color.fromARGB(255, 0, 47, 255),
                                fontWeight: .bold,
                                fontSize: 20
                              ))
                            ]
                          )
                        );
                      }
                    );
                  }
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border:Border.all(color: const Color.fromARGB(255, 110, 92, 126), width: 5),
                      borderRadius: .all(Radius.circular(20))
                    ),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .center,
                      children: [
                        Icon(Icons.warning, size: 50),
                        Text("BUTTON 2", style: TextStyle(fontSize: 15, fontWeight: .bold))
                      ]
                    )
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: const Text("WARNING !", style: TextStyle(fontWeight: .bold)),
                          content: const Text("Please !\nHave a wonderful day !"),
                          actions:<Widget>[
                            TextButton(
                              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
                              child: const Text("Okay !"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ]
                        );
                      }
                    );
                  }
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border:Border.all(color: const Color.fromARGB(255, 110, 92, 126), width: 5),
                      borderRadius: .all(Radius.circular(20))
                    ),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .center,
                      children: [
                        Icon(Icons.star, size: 50),
                        Text("BUTTON 3", style: TextStyle(fontSize: 15, fontWeight: .bold))
                      ]
                    )
                  ),
                  onTap: () {
                    toggleVisibility();
                  }
                )
              ]
            )),
            Visibility(
              visible: _isVisible,
              child: Column(
                children: [
                  Image(image: AssetImage("assets/ena.png")),
                  SizedBox(height:20),
                  Text("Surprise ! It's ENA !", style: TextStyle(fontWeight: .bold, fontSize: 30))
                ]
              )
            )
          ]
        )
    );
  }
}