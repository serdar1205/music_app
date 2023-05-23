import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/models/song_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/widgets/widgets.dart';

import 'package:rxdart/rxdart.dart' as rxdart;


class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {

  AudioPlayer audioPlayer = AudioPlayer();
  Song song = Get.arguments ?? Song.songs[0];

  @override
  void initState(){
    super.initState();
    audioPlayer.setAudioSource(ConcatenatingAudioSource(
        children: [
          AudioSource.uri(Uri.parse('assets:///${song.url}'))
        ]));
  }

  @override
  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream, (Duration position, Duration? duration) {
        return SeekBarData(position, duration ?? Duration.zero);
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(song.coverUrl, fit: BoxFit.cover,),
          _BackgroundFilter(),
          _MusicPlayer(
            song:song,
            audioPlayer: audioPlayer,
            seekBarDataStream: _seekBarDataStream,)


        ],
      ),
    );
  }
}

class _MusicPlayer extends StatelessWidget {
 final Stream<SeekBarData> seekBarDataStream;
 final AudioPlayer audioPlayer;
 final Song song;

   _MusicPlayer({Key? key, required this.seekBarDataStream, required this.audioPlayer, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(song.title,
            style:Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ) ,),
          SizedBox(height: 10,),
          Text(song.description,
            maxLines: 2,
            style:Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.white ,
            ) ,),
          SizedBox(height: 30,),

          StreamBuilder<SeekBarData>(
              stream: seekBarDataStream,
              builder:(context, snapshot){
                final positonData = snapshot.data;
                return SeekBar(
                  position: positonData?.duration ?? Duration.zero,
                  duration:positonData?.duration ?? Duration.zero,
                  onChangeEnd: audioPlayer.seek,
                );
              }
          ),
         PlayerButtons(audioPlayer: audioPlayer),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          IconButton(
          onPressed: (){},
            icon: Icon(Icons.settings , color: Colors.white,),
            iconSize: 35,
          ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.download , color: Colors.white,),
                iconSize: 35,
              )
            ],
          )
        ],
      ),
    );
  }
}





class _BackgroundFilter extends StatelessWidget {
  const _BackgroundFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect){
        return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.0),
            ],
            stops: const [
              0.0,
              0.4,
              0.6]
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.shade200,
                Colors.deepPurple.shade800,
              ]),
        ),
      ),
    );
  }
}

