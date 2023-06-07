import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
class musicPlayer extends StatefulWidget{
 @override
 State<musicPlayer> createState() => _musicPlayer();
}
class _musicPlayer extends State<musicPlayer>{
 final audioPlayer = AudioPlayer();
 bool isPlaying = false;
 Duration duration = Duration.zero;
 Duration position = Duration.zero;

 @override
 void initState() {
  super.initState();

  setAudio();

  audioPlayer.onPlayerStateChanged.listen((state) {
   setState(() {
    isPlaying = state == PlayerState.PLAYING;
   });
  });

  audioPlayer.onDurationChanged.listen((newDuration) {
   setState(() {
    duration = newDuration;
   });
  });

  audioPlayer.onAudioPositionChanged.listen((newPosition) {
   setState(() {
    position = newPosition;
   });
  });
 }

 Future setAudio() async {
  audioPlayer.setReleaseMode(ReleaseMode.LOOP);

  final player = AudioCache(prefix: 'assets/');
  final url = await player.load('varel.mp3');
  audioPlayer.setUrl(url.path, isLocal: true);
 }

 @override
 void dispose() {
  audioPlayer.dispose();

  super.dispose();
 }
    @override
 Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text("Music Player",
      style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,),
      ),

     ),
     body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
             image:  AssetImage('assets/noeasy.jpeg'),
            )
        ),
        SizedBox(height: 32),
        Text(
         'Sumarno in The House',
         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
         'Varel Vyno',
         style: TextStyle(fontSize: 20),
        ),
        Slider(
         min: 0,
         max: duration.inSeconds.toDouble(),
         value: position.inSeconds.toDouble(),
         onChanged: (value) async {
          final position = Duration(seconds: value.toInt());
          await audioPlayer.seek(position);

          await audioPlayer.resume();
         },
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 16),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Text(formatTime(position)),
           Text(formatTime(duration - position)),
          ],
         ),
        ),
        CircleAvatar(
         radius: 35,
         child: IconButton(
          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
          iconSize: 50,
          onPressed: () async {
           if (isPlaying) {
            await audioPlayer.pause();
           } else {
            String url = 'https://www.youtube.com/watch?v=Odn6XXmcvEw';
            await audioPlayer.resume();
           }
          },
         ),

        ),

       ],
      ),
     ),
    );
  }
 String formatTime(Duration position) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits (duration.inHours);
  final minutes = twoDigits (duration.inMinutes.remainder(60));
  final seconds = twoDigits (duration.inSeconds.remainder(60));

  return [
   if (duration.inHours > 0)
    hours,
   minutes,
   seconds,
  ].join(':');
 }
}