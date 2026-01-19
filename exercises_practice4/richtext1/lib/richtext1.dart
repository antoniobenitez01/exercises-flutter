import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';


class RichTextPage1 extends StatelessWidget {
 static const String routeName = '/richtextpage1';

  const RichTextPage1({super.key});

  @override
 Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("RichText 1", style: TextStyle(fontWeight: .bold)),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: RichText(
            textAlign: .center,
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 16),
              children: [
                TextSpan(text: "Just finished an amazing "),
                TextSpan(
                  text: "#Flutter",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 100,
                          color: Colors.cyan,
                          child: Center(child: Text(
                            "You pressed the Hashtag!", 
                            style: TextStyle(fontWeight: .bold, color: Colors.white, fontSize: 25)),)
                        );
                      }
                    ),
                ),
                TextSpan(text: " project! Thanks to "),
                TextSpan(
                  text: "@FlutterDev",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 100,
                          color: Colors.cyan,
                          child: Center(child: Text(
                            "You pressed the Mention!", 
                            style: TextStyle(fontWeight: .bold, color: Colors.white, fontSize: 25)),)
                        );
                      }
                    ),
                ),
                TextSpan(text: " for the inspiration! 🚀"),
              ],
            ),
          ),
        )
      ));
 }
}