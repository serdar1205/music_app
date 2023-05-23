import 'package:flutter/material.dart';
import 'package:music_app/models/playlist_model.dart';
import 'package:music_app/models/song_model.dart';
import 'package:music_app/widgets/custom_widgets/custom_widgets.dart';
import 'package:music_app/widgets/discover_music.dart';
import 'package:music_app/widgets/trending_music.dart';
import 'package:music_app/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Song> songs= Song.songs;
    List<Playlist> playlists = Playlist.playlist;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade800.withOpacity(0.8),
              Colors.deepPurple.shade200.withOpacity(0.8),
          ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar:CustomAppBar(),
        body: SingleChildScrollView(
            child: Column(
              children: [
                DiscoverMusic(),
                TrendingMusic(song: songs),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SectionHeader(title: 'Playlists'),
                      ListView.builder(
                        shrinkWrap: true,
                          padding: EdgeInsets.only(top: 20),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: playlists.length,
                          itemBuilder: (context, index){
                        return PlaylistCard(playlist: playlists[index],);
                      })
                    ],

                  ),
                )
              ],
            )),
      //  bottomNavigationBar: _CustomNavBar(),
      ),
    );
  }
}











