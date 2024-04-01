import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musick/presentation/cubits/song/song_cubit.dart';
import 'package:musick/presentation/widgets/neu_box.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../data/models/song/song_model.dart';

class SongList extends StatefulWidget {
  final List<Song> songs;
  final BuildContext homeContext;

  const SongList({super.key, required this.songs, required this.homeContext});

  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.songs.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            // print(index);
            // Navigator.pushNamed(context, "/CustomAudioPlayerScreen");
          },
          child: NeuBox(
            child: ListTile(

              leading: Hero(
                tag: (index+1)*1000,
                child: Image.network(
                  widget.songs[index].albumArtUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(widget.songs[index].name),
              subtitle: Text(widget.songs[index].artist),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      widget.songs[index].isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: widget.songs[index].isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        BlocProvider.of<SongCubit>(context).searchByGenreString("");
                        widget.songs[index].isFavorite? widget.songs[index].isFavorite = false : widget.songs[index].isFavorite = true;
                      });
                      // Handle favorite button press
                      // You can toggle the isFavorite property of the song here
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: () {
                      Navigator.pushNamed(widget.homeContext, "/CustomAudioPlayerScreen", arguments: {
                        "song": widget.songs[index],
                        "index": (index+1)*1000,
                      });
                      print(index);
                      // Handle play button press
                      // You can play the song using the songUrl property of the song here
                    },
                  ),
                ],
              ),
              onTap: ()  {

                Navigator.pushNamed(widget.homeContext, "/CustomAudioPlayerScreen", arguments: {
                  "song": widget.songs[index],
                  "index": (index+1)*1000,
                });
                // Handle tap on the ListTile (if needed)
              },
            ),
          ),
        );
      },
    );
  }
}
