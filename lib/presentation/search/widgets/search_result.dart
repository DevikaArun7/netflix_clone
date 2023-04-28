import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

import '../../../application/search/search_bloc.dart';

const imageLink =
    "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/6Lw54zxm6BAEKJeGlabyzzR5Juu.jpg";

class WigetSearchResult extends StatelessWidget {
  const WigetSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchTextTitle(title: 'Movies & TV'),
          kHeight,
          Expanded(child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                childAspectRatio: 1 / 1.5,
                mainAxisSpacing: 5,
                crossAxisSpacing: 8,
                shrinkWrap: true,
                crossAxisCount: 3,
                children: List.generate(20, (index) {
                  final movie = state.searchResultList[index];
                  return MainCard(imageUrl: movie.posterImageUrl);
                }),
              );
            },
          ))
        ],
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
    );
  }
}

// List<w>
