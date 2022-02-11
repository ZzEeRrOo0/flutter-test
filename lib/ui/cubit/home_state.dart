import 'package:equatable/equatable.dart';
import 'package:morphosis_flutter_demo/core/constant/app_contant.dart';
import 'package:morphosis_flutter_demo/non_ui/model/song.dart';

class HomeState extends Equatable {

  HomeState({
    this.songs = const [],
    this.dataStatus = DataStatus.initial,
    this.error
  });

  late final List<Song>? songs;
  late final String? error;
  final DataStatus dataStatus;

  HomeState copyWith({
    DataStatus? dataStatus,
    String? error,
    List<Song>? songs
  }){
    return HomeState(
      dataStatus: dataStatus ?? this.dataStatus,
      error: error,
      songs: songs ?? this.songs
    );
  }

  @override
  List<Object?> get props => [dataStatus, error, songs];
  
}