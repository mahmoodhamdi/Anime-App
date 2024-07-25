import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/anime/data/data_sources/anime_remote_data_source.dart';
import 'package:anime_app/features/anime/domain/entities/anime_entity.dart';
import 'package:anime_app/features/anime/domain/repository/anime_repository.dart';
import 'package:dartz/dartz.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDataSource _animeRemoteDataSource;
  AnimeRepositoryImpl(this._animeRemoteDataSource);
  @override
  Future<Either<Failure, List<AnimeEntity>>> getTopRatedAnime() async {
    return await _animeRemoteDataSource.getTopRatedAnime();
  }

  @override
  Future<Either<Failure, List<AnimeEntity>>> getPopularAnime() async {
    return await _animeRemoteDataSource.getPopularAnime();
  }

  @override
  Future<Either<Failure, List<AnimeEntity>>> getLatestAnime() async {
    return await _animeRemoteDataSource.getLatestAnime();
  }

  @override
  Future<Either<Failure, AnimeEntity>> getAnimeDetails(int id) async {
    return await _animeRemoteDataSource.getAnimeDetails(id);
  }
}
