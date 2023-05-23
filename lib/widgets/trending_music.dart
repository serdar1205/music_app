import 'package:flutter/material.dart';
import 'package:music_app/models/song_model.dart';
import 'package:music_app/widgets/widgets.dart';

class TrendingMusic extends StatelessWidget {
  final List<Song> song;
  const TrendingMusic({Key? key,required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SectionHeader(title: 'Trending Music',),
          ),
          SizedBox(height: 20,),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: song.length,
                itemBuilder: (context, index){
                  return SongCard(song: song[index],);
                }),
          )
        ],
      ),
    );
  }
}