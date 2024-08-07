import 'package:anime_app/core/constants/api_constants.dart';
import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/anime/data/models/anime_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AnimeRemoteDataSource {
  Future<Either<Failure, List<AnimeModel>>> getTopRatedAnime({int page = 1});
  Future<Either<Failure, List<AnimeModel>>> getPopularAnime({int page = 1});
  Future<Either<Failure, List<AnimeModel>>> getLatestAnime({int page = 1});
  Future<Either<Failure, AnimeModel>> getAnimeDetails(int id);
}

class AnimeRemoteDataSourceImpl implements AnimeRemoteDataSource {
  final Dio _dio;

  AnimeRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<Failure, List<AnimeModel>>> getTopRatedAnime(
      {int page = 1}) async {
    return _fetchAnimeList("$baseAnimeListUrl$page$topRated");
  }

  @override
  Future<Either<Failure, List<AnimeModel>>> getPopularAnime(
      {int page = 1}) async {
    return _fetchAnimeList("$baseAnimeListUrl$page$popular");
  }

  @override
  Future<Either<Failure, List<AnimeModel>>> getLatestAnime(
      {int page = 1}) async {
    return _fetchAnimeList(
        "https://kitsu.io/api/edge/anime?page%5Bnumber%5D=$page&page%5Bsize%5D=20&sort=-createdAt");
  }

  @override
  Future<Either<Failure, AnimeModel>> getAnimeDetails(int id) async {
    try {
      final response = await _dio.get("$baseAnimeUrl$id");
      if (response.statusCode == 200) {
        final anime = AnimeModel.fromJson(response.data['data']);
        return Right(anime);
      } else {
        return Left(
            ServerFailure.fromStatusCode(response.statusCode!, response.data));
      }
    } on DioException catch (dioException) {
      return Left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, List<AnimeModel>>> _fetchAnimeList(String url) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final List<AnimeModel> animeList = (response.data['data'] as List)
            .map((json) => AnimeModel.fromJson(json))
            .toList();
        return Right(animeList);
      } else {
        return Left(
            ServerFailure.fromStatusCode(response.statusCode!, response.data));
      }
    } on DioException catch (dioException) {
      return Left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
