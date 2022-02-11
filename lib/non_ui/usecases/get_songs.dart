import 'package:dartz/dartz.dart';
import 'package:morphosis_flutter_demo/core/error/failures.dart';
import 'package:morphosis_flutter_demo/core/usecases/no_param.dart';
import 'package:morphosis_flutter_demo/core/usecases/usecases.dart';
import 'package:morphosis_flutter_demo/non_ui/model/song.dart';
import 'package:morphosis_flutter_demo/non_ui/repo/home_repo.dart';

class GetSongsUseCase implements UseCase<List<Song>, NoParams> {

  final HomeRepositoryImpl homeRepositoryImpl = HomeRepositoryImpl();

  @override
  Future<Either<Failure, List<Song>>> call(NoParams) async {
    return await homeRepositoryImpl.getListSong();
  }
}
