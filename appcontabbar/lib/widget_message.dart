import 'package:flutter/material.dart';

class WidgetMessages extends StatefulWidget {
  const WidgetMessages({super.key});

  @override
  State<WidgetMessages> createState() => _WidgetMessagesState();
}

class _WidgetMessagesState extends State<WidgetMessages> {

  List<String> messages = [
    "This is Message 1",
    "This is Message 2",
    "This is Message 3",
    "This is Message 4",
    "This is Message 5",
    "This is Message 6",
    "This is Message 7",
    "This is Message 8",
    "This is Message 9 ",
    "This is Message 10",
  ];

  void _addMessage(){
    setState((){
      messages.add("This is Message ${messages.length+1}");
    });
  }

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
                Text("MESSAGES LIST",style: TextStyle(
                  fontWeight: .bold,
                  color: Colors.white
                ))
              ]
            )
          ),
          Container(
            margin: .all(5),
            height: 550,
            decoration: BoxDecoration(
              border:.symmetric(horizontal:BorderSide(
                  color: const Color.fromARGB(255, 110, 92, 126),
                  width: 10
                ),
                vertical: BorderSide(
                  color: const Color.fromARGB(255, 110, 92, 126),
                  width: 10
                )
              ),
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
                    title: Text('MESSAGE ${index + 1}', style: TextStyle(fontWeight: .bold)),
                    subtitle: Text(messages[index]),
                  )
                );
              },
              separatorBuilder: (context, index) => SizedBox( height: 10 ),
            )
          ),
          SizedBox(height:10),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap:(){
              _addMessage();
            },
            child: Ink(
              height: 75,
              width:  375,
              decoration:BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 110, 92, 126), width: 5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text('ADD NEW MESSAGE', style: TextStyle(
                fontSize: 20,
                fontWeight: .bold)),)
            )
          ),
        ]
      )
    );
  }
}