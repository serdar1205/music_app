class Song{
  final String title;
  final String url;
  final String coverUrl;

  Song({required this.title,required this.url,required this.coverUrl});

  static List<Song> songs = [
    Song(title: 'Feel', url: 'assets/music/feel.mp3', coverUrl: 'assets/images/d.jpg'),
    Song(title: 'Legion',  url: 'assets/music/Legion.mp3', coverUrl: 'assets/images/0.jpg'),
    Song(title: 'Life', url: 'assets/music/Life.mp3', coverUrl: 'assets/images/c.jpg'),
  ];

}