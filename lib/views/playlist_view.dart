import 'package:flutter/material.dart';
import 'package:music_app/models/playlist_model.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Playlist playlist = Playlist.playlist[0];
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
        appBar: AppBar(title: Text("Playlist"),backgroundColor: Colors.transparent, elevation: 0,) ,
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _PlayListInformation(playlist: playlist,),
                  SizedBox(height: 30,),
                  PlayOrShuffleSwitchCase(),
                  _PlaylistSongs(playlist: playlist,)
                ],
              ),
            )),

      ),
    );
  }
}

class _PlaylistSongs extends StatelessWidget {
  final Playlist playlist;
  const _PlaylistSongs({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: playlist.songs.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return ListTile(
            leading: Text(
                '${index+1}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold
                )
            ),
            title: Text(
                playlist.songs[index].title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold
                )
            ),
            subtitle: Text('${playlist.songs[index].title} - 02:45',),
            trailing: Icon(Icons.more_vert, color: Colors.white,),

          );
        });
  }
}

class PlayOrShuffleSwitchCase extends StatefulWidget {

   PlayOrShuffleSwitchCase({Key? key}) : super(key: key);

  @override
  State<PlayOrShuffleSwitchCase> createState() => _PlayOrShuffleSwitchCaseState();
}

class _PlayOrShuffleSwitchCaseState extends State<PlayOrShuffleSwitchCase> {
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        setState((){
          isPlay = !isPlay;
        });
      },
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Stack(

          children: [
            AnimatedPositioned(
              duration: Duration(microseconds: 200),
              left: isPlay ? 0 : width * 0.45,
              child: Container(
                height: 50,
                width: width * 0.45,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[400],
                    borderRadius: BorderRadius.circular(15)
                ),),
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Play",
                        style: TextStyle(
                            fontSize: 17,
                          color: isPlay == true ? Colors.white : Colors.deepPurple
                        ),),
                      ),
                      SizedBox(width: 10,),
                      Icon(Icons.play_circle,  color: isPlay == true ? Colors.white : Colors.deepPurple)
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Shuffle",
                        style: TextStyle(
                          fontSize: 17,
                          color: isPlay == true ? Colors.deepPurple : Colors.white
                        ),),
                      ),
                      SizedBox(width: 10,),
                      Icon(Icons.shuffle,  color: isPlay == true ? Colors.deepPurple : Colors.white)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class _PlayListInformation extends StatelessWidget {
  final Playlist playlist;
   _PlayListInformation({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            playlist.imageurl,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 30,),
        Text(playlist.title,
          style:Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ) ,),

      ],
    );
  }
}

