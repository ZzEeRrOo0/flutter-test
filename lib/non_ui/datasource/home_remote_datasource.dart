import 'package:dio/dio.dart';
import 'package:morphosis_flutter_demo/core/constant/api_path.dart';
import 'package:morphosis_flutter_demo/core/error/exceptions.dart';
import 'package:morphosis_flutter_demo/core/network/network_call.dart';
import 'package:morphosis_flutter_demo/non_ui/model/song.dart';

abstract class HomeRemoteDataSource {
  Future<List<Song>> getListSong();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {

  final RestClient restClient = RestClient(Dio());

  @override
  Future<List<Song>> getListSong() async {
    try{
      final jsonData = await restClient.fetchSong(APIPath.SECRET_KEY, APIPath.TOKEN_KEY);
      List<dynamic>? results = jsonData["response"]["songs"];
      return results != null ? results.map((e) => Song.fromJson(e)).toList() : [];
    }
    on CacheException catch (e) {
      throw CacheException(e.msg);
    }
    on ServerException catch (e) {
      throw ServerException(e.msg);
    }
  }

}