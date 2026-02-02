import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:vimeo_video_player/vimeo_video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final youtubeId = YoutubePlayer.convertUrlToId("https://youtu.be/dQw4w9WgXcQ?si=-3dPoarEPOXmUkQF");
final vimeoId = "303380455";

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
  
  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: youtubeId!,
    flags : const YoutubePlayerFlags(
      autoPlay : false,
      mute : true
    ),
  );
  bool isVideoLoading = true; 
  InAppWebViewController? webViewController;

  @override
  void dispose() {
    super.dispose();
    webViewController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vídeos de Youtube y Vimeo", style: TextStyle(color: Colors.white, fontWeight: .bold)),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: .all(20),
        child: SafeArea(
          child: ListView(
            children:[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: YoutubePlayer(controller: _controller)
              ),
              SizedBox(height:20),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: VimeoVideoPlayer(
                  videoId: vimeoId,
                  isAutoPlay: false,
                  onInAppWebViewCreated: (controller) {
                    webViewController = controller;
                  },
                  onReady: () {
                    setState(() {
                      isVideoLoading = false;
                    });
                  },
                  onInAppWebViewLoadStart: (controller, url) {
                    setState(() {
                      isVideoLoading = true;
                    });
                  },
                  onInAppWebViewLoadStop: (controller, url) {
                    setState(() {
                      isVideoLoading = false;
                    });
                  },
                ),
              ),
            ]
          ),
        )
      )
    );
  }
}

Widget thumbnail(){
  return Container(
    height: 200,
    margin: const EdgeInsets.all(10),
    color: Colors.red,
    child: const Center(
      child: Text("Thumbnail")
    )
  );
}
