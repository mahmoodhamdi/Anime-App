import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/anime/domain/entities/anime_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeRepository {
  

  Future<Either<Failure, List<AnimeEntity>>> getTopRatedAnime({int page = 1});

  Future<Either<Failure, List<AnimeEntity>>> getPopularAnime({int page = 1});

  Future<Either<Failure, List<AnimeEntity>>> getLatestAnime();

  Future<Either<Failure, AnimeEntity>> getAnimeDetails(int id);
}


