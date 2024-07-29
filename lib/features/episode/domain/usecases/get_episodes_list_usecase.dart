import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/episode/domain/entities/episode_entity.dart';
import 'package:anime_app/features/episode/domain/repository/episode_repository.dart';
import 'package:dartz/dartz.dart';

class GetEpisodesListUsecase {
  final EpisodeRepository episodeRepository;

  GetEpisodesListUsecase({
    required this.episodeRepository,
  });

  Future<Either<Failure, List<EpisodeEntity>>> call(
      {required String animeId, int page = 1}) async {
    return await episodeRepository.getEpisodesList(
        animeId: animeId, page: page);
  }
}
