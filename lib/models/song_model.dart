class Song{
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({required this.title,required this.description,required this.url,required this.coverUrl});

  static List<Song> songs = [
    Song(title: 'Feel', description: 'Feel', url: 'assets/music/feel.mp3', coverUrl: 'assets/images/d.jpg'),
    Song(title: 'Legion', description: 'Feel', url: 'assets/music/Legion.mp3', coverUrl: 'assets/images/0.jpg'),
    Song(title: 'Life', description: 'Feel', url: 'assets/music/Life/mp3', coverUrl: 'assets/images/c.jpg'),
  ];

}