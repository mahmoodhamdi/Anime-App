import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/manga/domain/entities/manga_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MangaRepository {
  Future<Either<Failure, List<MangaEntity>>> getTopRatedManga({int page = 1});

  Future<Either<Failure, List<MangaEntity>>> getPopularManga({int page = 1});

  Future<Either<Failure, List<MangaEntity>>> getLatestManga();

  Future<Either<Failure, MangaEntity>> getMangaDetails(int id);
}
