import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/episode/data/data_sources/episode_remote_data_source.dart';
import 'package:anime_app/features/episode/domain/entities/episode_entity.dart';
import 'package:anime_app/features/episode/domain/repository/episode_repository.dart';
import 'package:dartz/dartz.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeRemoteDataSource episodeRemoteDataSource;
  EpisodeRepositoryImpl({required this.episodeRemoteDataSource});
  @override
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodesList(
      {required String animeId, int page = 1}) async {
    return await episodeRemoteDataSource.getEpisodesList(
        animeId: animeId, page: page);
  }

  @override
  Future<Either<Failure, EpisodeEntity>> getEpisodeById(
      {required String id}) async {
    return await episodeRemoteDataSource.getEpisodeById(id: id);
  }
}
