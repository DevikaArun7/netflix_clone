import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/hot_and_new_response.dart';

import '../../domain/hot_and_new/model/hot_and_new_response.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    //on event get homescreen data
    on<GetHomeScreenData>((event, emit) async {
      //send loading to ui
      emit(state.copyWith(isLoading: true, hasError: false)); //get data
      final _movieResult = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewTVData();

      //transform data
      final _state1 = _movieResult.fold((MainFailure failure) {
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramaMovieList: [],
            southIndianMovieList: [],
            trendingTVList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResponse resp) {
        final pastYear = resp.results;
        final trendig = resp.results;
        final dramas = resp.results;
        final southIndian = resp.results;
        pastYear.shuffle();
        trendig.shuffle();
        dramas.shuffle();
        southIndian.shuffle();
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trendingMovieList: trendig,
            tenseDramaMovieList: dramas,
            southIndianMovieList: southIndian,
            trendingTVList: state.trendingTVList,
            isLoading: false,
            hasError: false);
      });

      emit(_state1);
      final _state2 = _tvResult.fold((MainFailure failure) {
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramaMovieList: [],
            southIndianMovieList: [],
            trendingTVList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResponse resp) {
        final topTenList = resp.results;
        return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: topTenList,
            tenseDramaMovieList: state.tenseDramaMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTVList: topTenList,
            isLoading: false,
            hasError: false);
      });

      //send to ui
    });
  }
}
