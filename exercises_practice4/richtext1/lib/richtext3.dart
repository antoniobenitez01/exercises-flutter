import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class RichTextPage3 extends StatelessWidget {
 static const String routeName = '/richtextpage3';

  const RichTextPage3({super.key});

  @override
 Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("RichText 3", style: TextStyle(fontWeight: .bold)),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(text: "By signing up, you agree to our "),
                TextSpan(
                  text: "Terms and Conditions",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 100,
                          color: Colors.cyan,
                          child: Center(child: Text(
                            "Terms and Conditions", 
                            style: TextStyle(fontWeight: .bold, color: Colors.white, fontSize: 25)),)
                        );
                      }
                    ),
                ),
                TextSpan(text: " and "),
                TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 100,
                          color: Colors.cyan,
                          child: Center(child: Text(
                            "Privacy Policy", 
                            style: TextStyle(fontWeight: .bold, color: Colors.white, fontSize: 25)),)
                        );
                      }
                    ),
                ),
              ],
            ),
          )
        )
      ));
 }
}