import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/song_model.dart';

class SongCard extends StatelessWidget {

  final Song song;

   SongCard({Key? key,
   required this.song
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed('/song',arguments: song);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15)
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width:  MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(song.coverUrl),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Container(
              height: 50,
              width:  MediaQuery.of(context).size.height * 0.20,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.8)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(song.title,
                        style:Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold
                        ) ,),
                      Text(song.description,
                        style:Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white ,
                          fontWeight: FontWeight.bold
                        ) ,),
                    ],
                  ),
                  Icon(Icons.play_circle, color: Colors.deepPurple,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
