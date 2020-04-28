import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoService with ChangeNotifier {
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  void intializeController() {
    videoPlayerController = VideoPlayerController.network(
      'https://adsfly.net/videos/After.mp4',
    );
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  void dispose() {
    videoPlayerController.dispose();

    chewieController.dispose();
  }
}
