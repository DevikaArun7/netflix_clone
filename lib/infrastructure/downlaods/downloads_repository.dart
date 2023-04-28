import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:dio/dio.dart';

import '../../domain/core/api_end_points.dart';

@LazySingleton(as: IDownloadsRespo)
class DownloadsRepository implements IDownloadsRespo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadsList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();

        // final List<Downloads> downloadsList = [];
        // log(response.data.toString());
        // for (final raw in response.data) {
        //   downloadsList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        // }
        print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
