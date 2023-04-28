import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/presentation/new_and_hot/everyones/widget/everyones_lists.dart';

import '../../../application/hot_and_new/hot_and_new_bloc.dart';
import '../../../core/strings.dart';

// class WidgetBuildEveriyone extends StatelessWidget {
//   const WidgetBuildEveriyone({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(8),
//       // children: List.generate(10, (index) => const WidgetEveryounesMedia()),
//       // children: [
//       //   WidgetEveryounesMedia()
//       // ],
//     );
//   }
// }

class WidgetBuildEveriyone extends StatelessWidget {
  const WidgetBuildEveriyone({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryOnIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryOnIsWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text('Error while loading coming soon list'),
            );
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(
              child: Text('Coming soon list is empty'),
            );
          } else {
            return ListView.builder(
              itemCount: state.everyOneIsWatchingList.length,
              itemBuilder: (context, index) {
                final movie = state.everyOneIsWatchingList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                // String month = '';
                // String date = '';
                // try {
                //   final fdate = DateTime.tryParse(movie.releaseDate!);
                //   final formatedDate =DateFormat.yMMMMd('en_US').format(fdate!);
                //   month =  formatedDate.split(' ').first.substring(0,3).toUpperCase();
                //   date = movie.releaseDate!.split('-')[1];
                // } catch (e) {
                //   month = '';
                //   date = '';
                // }
                final tv = state.everyOneIsWatchingList[index];

                return WidgetEveryounesMedia(
                    posterPath: '$imageAppendUrl${tv.posterPath}',
                    movieName: tv.originalName ?? 'No nime provided',
                    description: tv.overview ?? 'No description');
              },
            );
          }
        },
      ),
    );
  }
}
