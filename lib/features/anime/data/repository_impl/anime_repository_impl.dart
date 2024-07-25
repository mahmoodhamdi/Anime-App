import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/anime/data/data_sources/anime_remote_data_source.dart';
import 'package:anime_app/features/anime/domain/entities/anime_entity.dart';
import 'package:anime_app/features/anime/domain/repository/anime_repository.dart';
import 'package:dartz/dartz.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDataSource animeRemoteDataSource;
  AnimeRepositoryImpl({required this.animeRemoteDataSource});
  @override
  Future<Either<Failure, List<AnimeEntity>>> getTopRatedAnime(
      {int page = 1}) async {
    return await animeRemoteDataSource.getTopRatedAnime(page: page);
  }

  @override
  Future<Either<Failure, List<AnimeEntity>>> getPopularAnime(
      {int page = 1}) async {
    return await animeRemoteDataSource.getPopularAnime(page: page);
  }

  @override
  Future<Either<Failure, List<AnimeEntity>>> getLatestAnime() async {
    return await animeRemoteDataSource.getLatestAnime();
  }

  @override
  Future<Either<Failure, AnimeEntity>> getAnimeDetails(int id) async {
    return await animeRemoteDataSource.getAnimeDetails(id);
  }
}
