import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/anime/domain/entities/anime_entity.dart';
import 'package:anime_app/features/anime/domain/repository/anime_repository.dart';
import 'package:dartz/dartz.dart';

class GetAnimeDetailsUsecase {
  final AnimeRepository animeRepository;

  GetAnimeDetailsUsecase({required this.animeRepository});

  Future<Either<Failure, AnimeEntity>> call(int id) async {
    return await animeRepository.getAnimeDetails(id);
  }
}