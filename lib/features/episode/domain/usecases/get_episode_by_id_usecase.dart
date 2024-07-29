import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/episode/domain/entities/episode_entity.dart';
import 'package:anime_app/features/episode/domain/repository/episode_repository.dart';
import 'package:dartz/dartz.dart';

class GetEpisodeByIdUsecase {
  final EpisodeRepository episodeRepository;

  GetEpisodeByIdUsecase({
    required this.episodeRepository,
  });

  Future<Either<Failure, EpisodeEntity>> call({required String id}) async {
    return await episodeRepository.getEpisodeById(id: id);
  }
}
