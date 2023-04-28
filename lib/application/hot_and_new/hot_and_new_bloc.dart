import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/hot_and_new_response.dart';

import '../../domain/hot_and_new/model/hot_and_new_response.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    //get hot and new movie data
    on<LoadDataInComingSoon>((event, emit) async {
      //send loading to ui
      emit(const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false));
      //get data from remote
      final _result = await _hotAndNewService.getHotAndNewMovieData();
      //data to state

      final newState = _result.fold((MainFailure failure) {
        return const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResponse resp) {
        return HotAndNewState(
          comingSoonList: resp.results,
          everyOneIsWatchingList: state.everyOneIsWatchingList,
          isLoading: false,
          hasError: false,
        );
      });
      emit(newState);
    });

    on<LoadDataInEveryOnIsWatching>((event, emit) async{
      //send loading to ui
      emit(const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false));
      //get data from remote
      final _result = await _hotAndNewService.getHotAndNewTVData();
      //data to state

      final newState = _result.fold((MainFailure failure) {
        return const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNewResponse resp) {
        return HotAndNewState(
          comingSoonList: state.comingSoonList,
          everyOneIsWatchingList: resp.results,
          isLoading: false,
          hasError: false,
        );
      });
      emit(newState);
    });
  }
}
