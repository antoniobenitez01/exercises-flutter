import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube Video Player',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = YoutubePlayerController();
  @override
  void initState() {
    super.initState();
    // TO load a video by its unique id
    _controller.loadVideoById(videoId: "KGD-T3bhFEA");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          // Youtube player as widget
          child: YoutubePlayer(
            controller: _controller, // Controler that we created earlier
            aspectRatio: 16 / 9,      // Aspect ratio you want to take in screen
          ),
        ),
      ),
    );
  }
}
