import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/anime/domain/entities/anime_entity.dart';
import 'package:anime_app/features/anime/domain/repository/anime_repository.dart';
import 'package:dartz/dartz.dart';

class GetLatestAnimeUsecase {
  final AnimeRepository animeRepository;

  GetLatestAnimeUsecase({required this.animeRepository});

  Future<Either<Failure, List<AnimeEntity>>> call({int page = 1}) async {
    return await animeRepository.getLatestAnime(page: page);
  }
}
