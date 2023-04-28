import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/presentation/home/widgets/backround_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card_main.dart';
import '../widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, child) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.hasError) {
                    return const Center(
                        child: Text(
                      'Error while getting data',
                      style: TextStyle(color: Colors.white),
                    ));
                  }
                  //released past year
                  final _releasedPastYear = state.pastYearMovieList.map((e){
                    return '$imageAppendUrl${e.posterPath}';
                  }).toList();
                  //trending
                  final _trending = state.trendingMovieList.map((e){
                    return '$imageAppendUrl${e.posterPath}';
                  }).toList();
                  _trending.shuffle();
                  //tense darmas
                  final _tenseDarmas = state.tenseDramaMovieList.map((e){
                    return '$imageAppendUrl${e.posterPath}';
                  }).toList();
                  _tenseDarmas.shuffle();
                  //south indain movies
                  final _southIndian = state.southIndianMovieList.map((e){
                    return '$imageAppendUrl${e.posterPath}';
                  }).toList();
                  _southIndian.shuffle();
                  return ListView(
                    children:  [
                      WidgetBackgroundCard(),
                      MainCardWithTitle(
                        title: 'Released in the past year',
                        posterList: _releasedPastYear.sublist(0, 10),
                      ),
                      kHeight,
                      MainCardWithTitle(title: 'Trending Now', posterList: _trending.sublist(0, 10)),
                      kHeight,
                      WidgetNumberCardTop(),
                      MainCardWithTitle(title: 'Tense Daramas', posterList: _tenseDarmas.sublist(0, 10)),
                      kHeight,
                      MainCardWithTitle(
                        title: 'South Indian Cinema',
                        posterList: _southIndian.sublist(0, 10),
                      )
                    ],
                  );
                },
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      width: double.infinity,
                      height: 75,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            kBlackColor,
                            Colors.brown.withOpacity(0)
                          ])),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                'https://cdn-icons-png.flaticon.com/128/732/732228.png',
                                width: 40,
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                size: 30,
                                color: Colors.white,
                              ),
                              kWidth,
                              Container(
                                color: Colors.blue,
                                width: 30,
                                height: 30,
                              ),
                              kWidth
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'TV Shows',
                                style: kTextStyle,
                              ),
                              Text(
                                'Movies',
                                style: kTextStyle,
                              ),
                              Text(
                                'Categories',
                                style: kTextStyle,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : kHeight
            ],
          ),
        );
      },
    ));
  }
}
