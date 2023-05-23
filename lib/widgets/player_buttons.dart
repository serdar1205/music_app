import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerButtons extends StatelessWidget {
  final AudioPlayer audioPlayer;
  PlayerButtons({Key? key, required this.audioPlayer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder(
          stream: audioPlayer.sequenceStateStream,
            builder: (context, index){
            return IconButton(onPressed: audioPlayer.hasPrevious ? audioPlayer.seekToPrevious : null,
            icon: Icon(Icons.skip_previous , color: Colors.white,),
              iconSize: 45,
            );
            } ),

        StreamBuilder<PlayerState>(
            stream: audioPlayer.playerStateStream,
            builder:(context, snapshot){
              if(snapshot.hasData) {
                final playerState = snapshot.data;
                final processingState = playerState!.processingState;

                if(processingState == ProcessingState.loading ||
                    processingState == ProcessingState.buffering){
                  return Container(
                    height: 64,
                    width: 64,
                    margin: EdgeInsets.all(10),
                    child: CircularProgressIndicator(),
                  );
                }else if(!audioPlayer.playing){
                  return IconButton(
                      onPressed: audioPlayer.play,
                      iconSize: 75,
                      icon: Icon(Icons.play_circle,color: Colors.white,));
                }
                else if(processingState != ProcessingState.completed){
                  return IconButton(
                      onPressed: audioPlayer.pause,
                      iconSize: 75,
                      icon: Icon(Icons.pause_circle,color: Colors.white,));
                }
                else{
                  return IconButton(
                      onPressed:()=> audioPlayer.seek(Duration.zero,index: audioPlayer.effectiveIndices!.first),
                      iconSize: 75,
                      icon: Icon(Icons.replay_circle_filled_outlined,color: Colors.white,));
                }

              }else{
                return CircularProgressIndicator(color: Colors.deepPurple,);
              }
            }
        ),

        StreamBuilder(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, index){
              return IconButton(onPressed: audioPlayer.hasNext ? audioPlayer.seekToNext : null,
                icon: Icon(Icons.skip_next , color: Colors.white,),
                iconSize: 45,
              );
            } ),
      ],
    );
  }
}