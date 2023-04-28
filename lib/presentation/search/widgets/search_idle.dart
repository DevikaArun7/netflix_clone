import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

import '../../../core/strings.dart';

const imageUrl = [
  "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/6Lw54zxm6BAEKJeGlabyzzR5Juu.jpg",
  "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/remQq0nfQoxY9fVglGGegHZjFxx.jpg",
  "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/Abp35Z4fHCufCvYXURyfnKeaOON.jpg",
  "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/qqhzXiNyCotzJdyEbi41EtzYYYI.jpg",
  "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/dOqqnfLq1LFs7UlC9ZzMIgqbicu.jpg",
  "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/uDgy6hyPd82kOHh6I95FLtLnj6p.jpg",
];

class WidgetSearchIdle extends StatelessWidget {
  const WidgetSearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchTextTitle(title: 'Top Searches'),
          kHeight,
          Expanded(
            child:
                BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Error while getting data'),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text('List is Empty'),
                );
              }
              return ListView.separated(
                // shrinkWrap => Listview takes up as much space as it needs to fit.
                // shrinkWrap: true,
                itemBuilder: (context, index) {
                  final movie = state.idleList[index];
                  return TopSearchItemTile(
                      title: movie.title ?? 'No title provided',
                      imageUrl: '$imageAppendUrl${movie.posterPath}');
                },
                separatorBuilder: (context, index) => kHeight20,
                itemCount: state.idleList.length,
              );
            }),
          ),
        ],
      ),
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          height: 80,
          width: screenSize.width * 0.35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        kWidth,
        Expanded(
            child: Text(
          title,
          style:
              const TextStyle(color: kWhiteColor, fontWeight: FontWeight.bold),
        )),
        const Icon(
          CupertinoIcons.play_circle,
          color: kWhiteColor,
          size: 45,
        )
      ],
    );
  }
}
