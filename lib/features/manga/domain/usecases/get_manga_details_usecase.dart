import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/manga/domain/entities/manga_entity.dart';
import 'package:anime_app/features/manga/domain/repository/manga_repository.dart';
import 'package:dartz/dartz.dart';

class GetMangaDetailsUsecase {
  final MangaRepository mangaRepository;

  GetMangaDetailsUsecase({required this.mangaRepository});

  Future<Either<Failure, MangaEntity>> call(int id) async {
    return await mangaRepository.getMangaDetails(id);
  }
}
