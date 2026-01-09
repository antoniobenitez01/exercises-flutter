import 'package:flutter/material.dart';

class WidgetMessages extends StatefulWidget {
  const WidgetMessages({super.key});

  @override
  State<WidgetMessages> createState() => _WidgetMessagesState();
}

class _WidgetMessagesState extends State<WidgetMessages> {

  List<String> messages = [
    "Este es el Mensaje 1",
    "Este es el Mensaje 2",
    "Este es el Mensaje 3",
    "Este es el Mensaje 4",
    "Este es el Mensaje 5",
    "Este es el Mensaje 6",
    "Este es el Mensaje 7",
    "Este es el Mensaje 8",
    "Este es el Mensaje 9 ",
    "Este es el Mensaje 10",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 60,
            margin:.all(5),
            padding: .all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 110, 92, 126),
              borderRadius: .all(.circular(5))
            ),
            child: Row(
              children: [
                Icon(Icons.message, color: Colors.white),
                SizedBox(width:10),
                Text("LISTA DE MENSAJES",style: TextStyle(
                  fontWeight: .bold,
                  color: Colors.white
                ))
              ]
            )
          ),
          Container(
            margin: .all(5),
            height: 650,
            decoration: BoxDecoration(
              borderRadius: .all(.circular(10)),
              color: const Color.fromARGB(255, 110, 92, 126),
            ),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: .all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Material(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    title: Text('Mensaje ${index + 1}', style: TextStyle(fontWeight: .bold)),
                    subtitle: Text(messages[index]),
                  )
                );
              },
              separatorBuilder: (context, index) => SizedBox( height: 10 ),
            )
          )
        ]
      )
    );
  }
}