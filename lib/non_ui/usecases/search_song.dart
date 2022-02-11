import 'package:dartz/dartz.dart';
import 'package:morphosis_flutter_demo/core/error/failures.dart';
import 'package:morphosis_flutter_demo/core/usecases/usecases.dart';
import 'package:morphosis_flutter_demo/non_ui/model/song.dart';
import 'package:morphosis_flutter_demo/non_ui/repo/home_repo.dart';

class SearchSongsUseCase implements UseCase<List<Song>, String> {

  final HomeRepositoryImpl homeRepositoryImpl = HomeRepositoryImpl();

  @override
  Future<Either<Failure, List<Song>>> call(String query) async {
    return await homeRepositoryImpl.searchSong(query);
  }
}
