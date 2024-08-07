import 'package:anime_app/core/constants/api_constants.dart';
import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/manga/data/models/manga_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class MangaRemoteDataSource {
  Future<Either<Failure, List<MangaModel>>> getTopRatedManga({int page = 1});
  Future<Either<Failure, List<MangaModel>>> getPopularManga({int page = 1});
  Future<Either<Failure, List<MangaModel>>> getLatestManga();
  Future<Either<Failure, MangaModel>> getMangaDetails(int id);
}

class MangaRemoteDataSourceImpl implements MangaRemoteDataSource {
  final Dio _dio;

  MangaRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<Failure, List<MangaModel>>> getTopRatedManga(
      {int page = 1}) async {
    return _fetchMangaList("$baseMangaListUrl$page$topRated");
  }

  @override
  Future<Either<Failure, List<MangaModel>>> getPopularManga(
      {int page = 1}) async {
    return _fetchMangaList("$baseMangaListUrl$page$popular");
  }

  @override
  Future<Either<Failure, List<MangaModel>>> getLatestManga() async {
    return _fetchMangaList(
        "https://kitsu.io/api/edge/manga?page%5Blimit%5D=10&page%5Boffset%5D=0&sort=-createdAt");
  }

  @override
  Future<Either<Failure, MangaModel>> getMangaDetails(int id) async {
    try {
      final response = await _dio.get("$baseMangaUrl$id");
      if (response.statusCode == 200) {
        final manga = MangaModel.fromJson(response.data['data']);
        return Right(manga);
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

  Future<Either<Failure, List<MangaModel>>> _fetchMangaList(String url) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final List<MangaModel> mangaList = (response.data['data'] as List)
            .map((json) => MangaModel.fromJson(json))
            .toList();
        return Right(mangaList);
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
