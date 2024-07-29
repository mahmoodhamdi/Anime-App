import 'package:anime_app/core/constants/api_constants.dart';
import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/episode/data/models/episode_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class EpisodeRemoteDataSource {
  Future<Either<Failure, List<EpisodeModel>>> getEpisodesList(
      {required String animeId, int page = 1});

  Future<Either<Failure, EpisodeModel>> getEpisodeById({required String id});
}

class EpisodeRemoteDataSourceImpl implements EpisodeRemoteDataSource {
  final Dio _dio;

  EpisodeRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<Failure, List<EpisodeModel>>> getEpisodesList(
      {required String animeId, int page = 1}) async {
    try {
      final response = await _dio.get(
        '$episodeByAnimeId$animeId$afterEpisodeByAnimeId',
      );
      final episodes = (response.data['data'] as List)
          .map((json) => EpisodeModel.fromJson(json))
          .toList();
      return Right(episodes);
    } on DioException catch (dioException) {
      return Left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, EpisodeModel>> getEpisodeById(
      {required String id}) async {
    try {
      final response = await _dio.get('$episodeById$id');
      final episode = EpisodeModel.fromJson(response.data['data']);
      return Right(episode);
    } on DioException catch (dioException) {
      return Left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
