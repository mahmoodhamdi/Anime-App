import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/manga/data/data_sources/manga_remote_data_source.dart';
import 'package:anime_app/features/manga/domain/entities/manga_entity.dart';
import 'package:anime_app/features/manga/domain/repository/manga_repository.dart';
import 'package:dartz/dartz.dart';

class MangaRepositoryImpl implements MangaRepository {
  final MangaRemoteDataSource mangaRemoteDataSource;
  MangaRepositoryImpl({required this.mangaRemoteDataSource});
  @override
  Future<Either<Failure, List<MangaEntity>>> getTopRatedManga(
      {int page = 1}) async {
    return await mangaRemoteDataSource.getTopRatedManga(page: page);
  }

  @override
  Future<Either<Failure, List<MangaEntity>>> getPopularManga(
      {int page = 1}) async {
    return await mangaRemoteDataSource.getPopularManga(page: page);
  }

  @override
  Future<Either<Failure, List<MangaEntity>>> getLatestManga() async {
    return await mangaRemoteDataSource.getLatestManga();
  }

  @override
  Future<Either<Failure, MangaEntity>> getMangaDetails(int id) async {
    return await mangaRemoteDataSource.getMangaDetails(id);
  }
}
