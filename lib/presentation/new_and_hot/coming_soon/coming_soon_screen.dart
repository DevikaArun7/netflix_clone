import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/presentation/new_and_hot/coming_soon/widget/coming_soon_lists.dart';

import '../../../application/hot_and_new/hot_and_new_bloc.dart';

class WidgetBuildComingSoon extends StatelessWidget {
  const WidgetBuildComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
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
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text('Coming soon list is empty'),
            );
          } else {
            return ListView.builder(
              itemCount: state.comingSoonList.length,
              itemBuilder: (context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                String month = '';
                String date = '';
                try {
                  final fdate = DateTime.tryParse(movie.releaseDate!);
                  final formatedDate =
                      DateFormat.yMMMMd('en_US').format(fdate!);
                  month = formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  date = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  date = '';
                }
                // final _date =DateTime.parse(movie.releaseDate!);
                // final formatedDate = DateFormat.yMMMMd('en_US').format(_date);
                return WidgetComingSoonContent(
                    id: movie.id.toString(),
                    month: month,
                    day: date,
                    posterPath: '$imageAppendUrl${movie.posterPath}',
                    movieName: movie.originalTitle ?? 'No title',
                    description: movie.overview ?? 'No description');
              },
            );
          }
        },
      ),
    );
  }
}
