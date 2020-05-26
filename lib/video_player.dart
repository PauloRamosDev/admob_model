import 'package:awsome_video_player/awsome_video_player.dart';
import 'package:flutter/material.dart';
import 'package:screen/screen.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({Key key, this.link}) : super(key: key);

  final String link;

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    Screen.keepOn(true);
    return Scaffold(
      backgroundColor: Colors.black,
      body: body(),
    );
  }

  body() {
    return Center(
      child: AwsomeVideoPlayer(
        widget.link,
        onbrightness: ,
        onplay: (value) {
          print('play ${value.isPlaying}');
        },
        playOptions: VideoPlayOptions(
            seekSeconds: 30,
            aspectRatio: 16 / 9,
            loop: true,
            autoplay: true,
//            allowScrubbing: true,
            startPosition: Duration(seconds: 0)),
        videoStyle: VideoStyle(
          videoTopBarStyle: VideoTopBarStyle(),
          videoControlBarStyle: VideoControlBarStyle(
            playIcon: Icon(Icons.play_arrow, color: Colors.white, size: 16),
            pauseIcon: Icon(
              Icons.pause,
              color: Colors.red,
              size: 16,
            ),
            rewindIcon: Icon(
              Icons.replay_30,
              size: 16,
              color: Colors.white,
            ),
            forwardIcon: Icon(
              Icons.forward_30,
              size: 16,
              color: Colors.white,
            ),
            fullscreenIcon: Icon(
              Icons.fullscreen,
              size: 16,
              color: Colors.white,
            ),
            fullscreenExitIcon: Icon(
              Icons.fullscreen_exit,
              size: 16,
              color: Colors.red,
            ),
          ),
        ),
        onfullscreen: (full) {
          print(full);
        },
      ),
    );
  }
}
