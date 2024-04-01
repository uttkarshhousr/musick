import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musick/config/theme/theme_data.dart';
import 'package:musick/data/models/song/song_model.dart';

class HorizontalSongList extends StatelessWidget {
  final List<Song> songs;
  final BuildContext homeContext;

  const HorizontalSongList({required this.songs, required this.homeContext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return GestureDetector(
            onTap: (){
              Navigator.of(homeContext).pushNamed(
                  arguments: {
                    "song": songs[index],
                    "index": index
                  },
                  '/CustomAudioPlayerScreen');
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
               // Adjust as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.network(
                        songs[index].albumArtUrl,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        song.name,
                        style: myThemePlayfair.textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        song.artist,
                        style: myThemePlayfair.textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}