import 'package:dartz/dartz.dart';
import 'package:morphosis_flutter_demo/core/error/exceptions.dart';
import 'package:morphosis_flutter_demo/core/error/failures.dart';
import 'package:morphosis_flutter_demo/non_ui/datasource/home_local_datasource.dart';
import 'package:morphosis_flutter_demo/non_ui/datasource/home_remote_datasource.dart';

import 'package:morphosis_flutter_demo/non_ui/model/song.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Song>>> getListSong();
  Future<Either<Failure, List<Song>>> searchSong(String query);
}

class HomeRepositoryImpl extends HomeRepository {

  final HomeRemoteDataSourceImpl homeRemoteDataSource = HomeRemoteDataSourceImpl();
  final HomeLocalDataSourceImpl homeLocalDataSourceImpl = HomeLocalDataSourceImpl();

  @override
  Future<Either<Failure, List<Song>>> getListSong() async {
    try {
      List<Song> songs = await homeRemoteDataSource.getListSong();
      await homeLocalDataSourceImpl.saveListsong(songs);
      return Right(songs);
    }
    on CacheException catch (e) {
      return Left(CacheFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, List<Song>>> searchSong(String query) async {
    try {
      List<SongHive> songHive = await homeLocalDataSourceImpl.searchSong(query);
      List<Song> songs = songHive.map((e) => Song(artist_names: e.artist_names, full_title: e.full_title, song_art_image_url: e.song_art_image_url)).toList();
      return Right(songs);
    }
    on CacheException catch (e) {
      return Left(CacheFailure(e.msg));
    }
  }
  
}