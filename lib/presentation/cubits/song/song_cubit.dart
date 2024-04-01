import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musick/data/models/song/song_model.dart';
import 'package:musick/data/repositories/songRepo/fetch_songdata.dart';

class SongCubit extends Cubit<List<Song>> {
  List<Song> allSongs;
  SongCubit(this.allSongs) : super(allSongs.toList());

  void searchSongs(String query) {
    // allSongs = SongDataRepository().fetchSongData();
    // if (query.isEmpty) {
    //   emit(allSongs.toList());
    //   return;
    // }
    final results = allSongs.where((song) =>
    song.name.toLowerCase().contains(query.toLowerCase()) ||
        song.artist.toLowerCase().contains(query.toLowerCase()));
    emit(results.toList());
  }
  void searchByGenreString(String genreString) {
    GenreEnum genre;
    switch (genreString.toLowerCase()) {
      case 'chill':
        genre = GenreEnum.chill;
        break;
      case 'pop':
        genre = GenreEnum.pop;
        break;
      case 'relax':
        genre = GenreEnum.relax;
        break;
      case 'party':
        genre = GenreEnum.party;
        break;
      default:
      // Handle invalid genre string, or return all songs
        emit(allSongs.toList());
        return;
    }

    final results = allSongs.where((song) => song.genre == genre).toList();

    // Update albumUrl based on genre
    for (var song in results) {
      switch (genre) {
        case GenreEnum.chill:
          song.backgroundUrl = 'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
          break;
        case GenreEnum.pop:
          song.backgroundUrl = 'https://images.pexels.com/photos/375893/pexels-photo-375893.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
          break;
        case GenreEnum.relax:
          song.backgroundUrl = "https://images.pexels.com/photos/312839/pexels-photo-312839.jpeg?auto=compress&cs=tinysrgb&w=800";
          break;
        case GenreEnum.party:
          song.backgroundUrl = 'https://images.pexels.com/photos/1190298/pexels-photo-1190298.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
          break;
        default:
          song.backgroundUrl = "https://images.pexels.com/photos/6063609/pexels-photo-6063609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";
        // Handle other cases if needed
          break;
      }
    }

    emit(results);
  }

}