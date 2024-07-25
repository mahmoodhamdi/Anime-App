import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/anime/domain/entities/anime_entity.dart';
import 'package:anime_app/features/anime/domain/repository/anime_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularAnimeUsecase {
  final AnimeRepository animeRepository;

  GetPopularAnimeUsecase({required this.animeRepository});

  Future<Either<Failure, List<AnimeEntity>>> call() async {
    return await animeRepository.getPopularAnime();
  }
}