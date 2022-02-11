import 'package:hive/hive.dart';
import 'package:morphosis_flutter_demo/core/error/exceptions.dart';
import 'package:morphosis_flutter_demo/non_ui/model/song.dart';

part 'home_local_datasource.g.dart';

abstract class HomeLocalDataSource {
  Future<void> saveListsong(List<Song> songs);
  Future<List<SongHive>> searchSong(String query);
}

@HiveType(typeId: 0)
class SongHive {
  SongHive({required this.artist_names, required this.full_title, required this.song_art_image_url});

  @HiveField(0)
  String artist_names;

  @HiveField(1)
  String full_title;

  @HiveField(2)
  String song_art_image_url;
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {

  @override
  Future<void> saveListsong(List<Song> songs) async {
    try {
      var box = await Hive.openBox('listSong');

      final List<SongHive> listSong = songs.map((e) => SongHive(artist_names: e.artist_names, full_title: e.full_title, song_art_image_url: e.song_art_image_url)).toList();

      await box.put('songs', listSong);
    }
    on CacheException catch (e) {
      throw CacheException(e.msg);
    }
  }

  @override
  Future<List<SongHive>> searchSong(String query) async {
    try {
      var box = await Hive.openBox('listSong');
      List<SongHive> songs = box.get("songs");
      var results = songs.where((element) => element.artist_names.toLowerCase().contains(query.toLowerCase()) ||
        element.full_title.toLowerCase().contains(query.toLowerCase())).toList();
      return results;
    }
    on CacheException catch (e) {
      throw CacheException(e.msg);
    }
  }
  
}