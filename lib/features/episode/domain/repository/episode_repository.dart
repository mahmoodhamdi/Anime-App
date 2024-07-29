import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/episode/domain/entities/episode_entity.dart';
import 'package:dartz/dartz.dart';

abstract class EpisodeRepository {
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodesList(
      {required String animeId, int page});

  Future<Either<Failure, EpisodeEntity>> getEpisodeById({required String id});
}
