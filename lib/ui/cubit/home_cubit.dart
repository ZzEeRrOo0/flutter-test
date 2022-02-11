import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morphosis_flutter_demo/core/constant/app_contant.dart';
import 'package:morphosis_flutter_demo/core/usecases/no_param.dart';
import 'package:morphosis_flutter_demo/non_ui/usecases/get_songs.dart';
import 'package:morphosis_flutter_demo/non_ui/usecases/search_song.dart';
import 'package:morphosis_flutter_demo/ui/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  final GetSongsUseCase getSongsUseCase = GetSongsUseCase();
  final SearchSongsUseCase searchSongsUseCase = SearchSongsUseCase();
  
  HomeCubit() : super(HomeState());

  TextEditingController searchTextField = TextEditingController(text: "");
  ScrollController scrollController = ScrollController();

  Future<void> getListSong() async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final req = await getSongsUseCase.call(NoParams());

    req.fold(
      (error) => emit(state.copyWith(dataStatus: DataStatus.failure, error: error.msg)), 
      (songs) => emit(state.copyWith(dataStatus: DataStatus.success, songs: songs))
    );
  }

  Future<void> searchSong(String query) async {
    emit(state.copyWith(dataStatus: DataStatus.loading));
    final req = await searchSongsUseCase.call(query);

    req.fold(
      (error) => emit(state.copyWith(dataStatus: DataStatus.failure, error: error.msg)), 
      (songs) => emit(state.copyWith(dataStatus: DataStatus.success, songs: songs))
    );
  }
}
