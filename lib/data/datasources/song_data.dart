import 'package:audioplayers/audioplayers.dart';
import 'package:musick/config/theme/app_utils.dart';

import 'package:musick/data/models/song/song_model.dart';

List<Song> songData = [
  Song(
    name: "Shape of You",
    genre: GenreEnum.party,
    artist: "Ed Sheeran",
    backgroundUrl: "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",

    albumArtUrl: "https://upload.wikimedia.org/wikipedia/en/b/b4/Shape_Of_You_%28Official_Single_Cover%29_by_Ed_Sheeran.png",
    songUrl: AssetSource(AppSongs.shapeofyou),
  ),
  Song(
    name: "Someone Like You",
    genre: GenreEnum.party,
    artist: "Adele",
    backgroundUrl: "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    albumArtUrl: "https://upload.wikimedia.org/wikipedia/en/7/7a/Adele_-_Someone_Like_You.png",
    songUrl: AssetSource(AppSongs.shapeofyou),
  ),
  Song(
    name: "Starboy",
    genre: GenreEnum.pop,
    artist: "weeknd",
    backgroundUrl: "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    albumArtUrl: "https://upload.wikimedia.org/wikipedia/en/3/3f/The_Weeknd_-_Starboy_%28single%29.jpg",
    songUrl: AssetSource(AppSongs.starboy),
  ),
  Song(
    name: "One kiss",
    genre: GenreEnum.party,
    artist: "Dua Lipa",
    backgroundUrl: "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    albumArtUrl: "https://upload.wikimedia.org/wikipedia/en/3/3e/Calvin_Harris_and_Dua_Lipa_One_Kiss.png",
    songUrl: AssetSource(AppSongs.shapeofyou),
  ),
  Song(
    name: "Someone You Loved",
    genre: GenreEnum.pop,
    artist: "Lewis Capaldi",
    backgroundUrl: "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    albumArtUrl: "https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg?auto=compress&cs=tinysrgb&w=800",
    songUrl: AssetSource(AppSongs.shapeofyou),
  ),
  Song(
    name: "Moonlight",
    genre: GenreEnum.pop,
    artist: "XXXTENTACION",
    backgroundUrl: "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    albumArtUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST25qaLxJN1Siwvpxp-05eKKEkXpU_Mtgq4w&s",
    songUrl: AssetSource(AppSongs.shapeofyou),
  ),
  Song(
    name: "Don't Stop Believin'",
    genre: GenreEnum.party,
    artist: "Journey",
    backgroundUrl: "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    albumArtUrl: "https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg?auto=compress&cs=tinysrgb&w=800",
    songUrl: AssetSource(AppSongs.shapeofyou),
  ),
  Song(
    name: "My eyes",
    genre: GenreEnum.chill,
    artist: "Travis Scott",
    backgroundUrl: "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    albumArtUrl: "https://upload.wikimedia.org/wikipedia/en/7/7e/Travis_My_Eyes.png",
    songUrl: AssetSource(AppSongs.shapeofyou),
  ),
  Song(
    name: "Someone You Like",
    genre: GenreEnum.chill,
    artist: "The Girl",
    backgroundUrl: "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    albumArtUrl: "https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg?auto=compress&cs=tinysrgb&w=800",
    songUrl: AssetSource(AppSongs.shapeofyou),
  ),
  Song(
    name: "Happier",
    genre: GenreEnum.chill,
    artist: "Marshmello ft. Bastille",
    backgroundUrl: "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    albumArtUrl: "https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg?auto=compress&cs=tinysrgb&w=800",
    songUrl: AssetSource(AppSongs.shapeofyou),
  ),
  Song(
    name: "Girls Like You",
    genre: GenreEnum.relax,
    artist: "Maroon 5 ft. Cardi B",
    backgroundUrl: "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    albumArtUrl: "https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg?auto=compress&cs=tinysrgb&w=800",
    songUrl: AssetSource(AppSongs.shapeofyou),
  ),
  Song(
    name: "Memories",
    genre: GenreEnum.chill,
    artist: "Maroon 5",
    backgroundUrl: "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    albumArtUrl: "https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg?auto=compress&cs=tinysrgb&w=800",
    songUrl: AssetSource(AppSongs.shapeofyou),
  ),
  Song(
    name: "I Wanna Live",
    genre: GenreEnum.relax,
    artist: "ZAYN, Taylor Swift",
    backgroundUrl: "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    albumArtUrl: "https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg?auto=compress&cs=tinysrgb&w=800",
    songUrl: AssetSource(AppSongs.shapeofyou),
  ),
  Song(
    name: "Stitches",
    genre: GenreEnum.relax,
    artist: "Shawn Mendes",
    backgroundUrl: "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    albumArtUrl: "https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg?auto=compress&cs=tinysrgb&w=800",
    songUrl: AssetSource(AppSongs.shapeofyou),
  ),
  Song(
    name: "Watermelon Sugar",
    genre: GenreEnum.party,
    artist: "Harry Styles",
    backgroundUrl: "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    albumArtUrl: "https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg?auto=compress&cs=tinysrgb&w=800",
    songUrl: AssetSource(AppSongs.shapeofyou),
  ),
];
