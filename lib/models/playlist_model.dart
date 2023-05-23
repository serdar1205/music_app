import 'song_model.dart';

class Playlist{
  final String title;
  final String imageurl;
   List<Song> songs;

  Playlist({required this.title,required this.imageurl,required this.songs});

  static List<Playlist> playlist = [
    Playlist(title: 'Classical', songs: Song.songs,  imageurl: 'assets/images/d.jpg',),
    Playlist(title: 'Jazz',songs: Song.songs, imageurl: 'assets/images/0.jpg',),
    Playlist(title: 'Pop', songs: Song.songs, imageurl: 'assets/images/c.jpg', ),
  ];

}