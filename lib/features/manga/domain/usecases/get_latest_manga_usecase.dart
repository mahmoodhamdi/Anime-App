import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/manga/domain/entities/manga_entity.dart';
import 'package:anime_app/features/manga/domain/repository/manga_repository.dart';
import 'package:dartz/dartz.dart';

class GetLatestMangaUsecase {
  final MangaRepository mangaRepository;

  GetLatestMangaUsecase({required this.mangaRepository});

  Future<Either<Failure, List<MangaEntity>>> call() async {
    return await mangaRepository.getLatestManga();
  }
}
