import 'package:musick/data/datasources/song_data.dart';
import 'package:musick/data/models/song/song_model.dart';

class SongDataRepository {


  // Asynchronous function to fetch staff data
  List<Song> fetchSongData()  {
    try {
      return songData;
    } catch (ex) {
      // Re-throw the exception for error handling in the calling code
      rethrow;
    }
  }
}