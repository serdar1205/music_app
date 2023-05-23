import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/home_view.dart';
import 'views/playlist_view.dart';
import 'views/song_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Music',
      theme: ThemeData(textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white
      ),),
      home: HomeScreen(),
      getPages: [
        GetPage(name: '/', page:()=> HomeScreen()),
        GetPage(name: '/song', page:()=> SongScreen()),
        GetPage(name: '/playlist', page:()=> PlayListScreen()),
      ],
    );
  }
}

