import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/manga/domain/entities/manga_entity.dart';
import 'package:anime_app/features/manga/domain/repository/manga_repository.dart';
import 'package:dartz/dartz.dart';

class GetTopRatedMangaUsecase {
  final MangaRepository mangaRepository;

  GetTopRatedMangaUsecase({
    required this.mangaRepository,
  });

  Future<Either<Failure, List<MangaEntity>>> call({int page = 1}) async {
    return await mangaRepository.getTopRatedManga(page: page);
  }
}
