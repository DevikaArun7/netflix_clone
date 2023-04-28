import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/hot_and_new/hot_and_new_response.dart';
import 'package:netflix_clone/domain/hot_and_new/model/hot_and_new_response.dart';

import '../../domain/core/api_end_points.dart';


@LazySingleton(as: HotAndNewService)
class HotAndNewImplementation implements HotAndNewService{
  @override
  Future<Either<MainFailure, HotAndNewResponse>> getHotAndNewMovieData() async{
     try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.hotAndNewMovie);
      // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResponse.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNewResponse>> getHotAndNewTVData() async{
    try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.hotAndNewTV);
      // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResponse.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

}