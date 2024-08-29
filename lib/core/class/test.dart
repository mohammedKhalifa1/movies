import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShowVideo extends StatefulWidget {
  const ShowVideo({Key? key}) : super(key: key);

  @override
  State<ShowVideo> createState() => _ShowVideoState();
}

class _ShowVideoState extends State<ShowVideo> {
  @override
  ChewieController? chewieController;
  late VideoPlayerController videoPlayerController;

  showVideo() async {
    setState(() {});
    videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    await videoPlayerController.initialize();
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true);
    setState(() {});
  }

  void initState() {
    showVideo();
    super.initState();
  }

  @override
  void dispose() {
    // for stope video if you back
    chewieController!.dispose();
    videoPlayerController.pause();
    videoPlayerController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: chewieController != null
              ? Chewie(controller: chewieController!)
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// void main() => runApp(const VideoApp());

// /// Stateful widget to fetch and then display video content.
// class VideoApp extends StatefulWidget {
//   const VideoApp({super.key});

//   @override
//   _VideoAppState createState() => _VideoAppState();
// }

// class _VideoAppState extends State<VideoApp> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() async {
//     super.initState();
//     // _controller = VideoPlayerController.network(
//     //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
//     // await _controller.initialize();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Demo',
//       home: Scaffold(
//         body: Center(
//           child: _controller.value.isInitialized
//               ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//               : Container(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _controller.value.isPlaying
//                   ? _controller.pause()
//                   : _controller.play();
//             });
//           },
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
