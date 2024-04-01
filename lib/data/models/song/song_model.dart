import 'package:audioplayers/audioplayers.dart';

enum GenreEnum {chill,pop,relax,party}
class Song {
  String name;
  String artist;
  String albumArtUrl;
  String backgroundUrl;
  AssetSource songUrl;
  GenreEnum genre;
  bool isFavorite;

  Song({
    required this.name,
    required this.genre,
    required this.backgroundUrl,
    required this.artist,
    required this.albumArtUrl,
    required this.songUrl,
    this.isFavorite = false,
  });
}
