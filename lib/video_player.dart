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


  //var link = 'https://r8---sn-uphcg51pa-bg0e.googlevideo.com/videoplayback?expire=1586397862&ei=JhKOXrzsA4XyzLUPsdeYkAE&ip=179.35.49.173&id=63c649fcb42d3494&itag=18&source=blogger&mh=Gy&mm=31&mn=sn-uphcg51pa-bg0e&ms=au&mv=m&mvi=7&pcm2cms=yes&pl=21&usequic=no&susc=bl&mime=video/mp4&dur=1210.038&lmt=1530233033615277&mt=1586368954&sparams=expire,ei,ip,id,itag,source,susc,mime,dur,lmt&sig=AJpPlLswRgIhAKCRfaDbkZlNO8q3eq4mTD8qdijMfPZVmu6RMcIab6aWAiEA8X7hx8MbkiFy_tGaVI7vIgoeZs0YU5Ntl-8z60vTcmQ%3D&lsparams=mh,mm,mn,ms,mv,mvi,pcm2cms,pl,usequic&lsig=ALrAebAwRAIgSfaxTRaKnhTayJDGTt465eSSKlUoY-Dvh9mjW_qM0CECICa6Ny9-SxLe0Y9Ahl5YzHNW-7-QF2K_h5q8gfXAhi6Y&cpn=6kh8zmYou8bFGWsA&c=WEB_EMBEDDED_PLAYER&cver=20200406';

  //var link2 = 'https://s-delivery9.mxdcontent.net/v/4648184bcc712b74f1ba657fe06c6dfa.mp4?s=OfPT2pjSA54BKrHKPE_IrA&e=1586391969';


  // var link3 = 'https://r8---sn-uphcg51pa-bg0e.googlevideo.com/videoplayback?expire=1586402995&ei=MyaOXu3oFdelj-8P8Ke32AI&ip=179.35.49.173&id=68ec468339e8f6b1&itag=18&source=blogger&mh=B1&mm=31&mn=sn-uphcg51pa-bg0e&ms=au&mv=m&mvi=7&pcm2cms=yes&pl=21&usequic=no&susc=bl&mime=video/mp4&dur=1416.766&lmt=1317571211162633&mt=1586374116&sparams=expire,ei,ip,id,itag,source,susc,mime,dur,lmt&sig=AJpPlLswRQIhAIhUnD8hLAwhgJre1SEby25UtO7atf-oEiugkNv-1zzIAiAYTo5ppXwTMxwMpXS2auSsgE2qpgcCoQ-2_4rbCfrQmw%3D%3D&lsparams=mh,mm,mn,ms,mv,mvi,pcm2cms,pl,usequic&lsig=ALrAebAwRAIgMgjFzBAQqWsCm0ArQrXqEW0ScBSq7yrGtrR31eV2zOoCIGi-j4jYRQC5IqxgA85jkU4bo_0jF_IC72RXXN6iWToN&cpn=UN9ov_gR7vCcX5X3&c=WEB_EMBEDDED_PLAYER&cver=20200406';

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
        onplay: (value) {
          print('play ${value.isPlaying}');
        },
        playOptions: VideoPlayOptions(
            seekSeconds: 30,
            aspectRatio: 16 / 9,
            loop: true,
            autoplay: true,
            allowScrubbing: true,
            startPosition: Duration(seconds: 0)),
        videoStyle: VideoStyle(
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
