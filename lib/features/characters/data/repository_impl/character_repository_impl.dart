import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/characters/data/data_sources/character_remote_data_source.dart';
import 'package:anime_app/features/characters/domain/entities/character_entity.dart';
import 'package:anime_app/features/characters/domain/entities/media_character_entity.dart';
import 'package:anime_app/features/characters/domain/repository/character_repository.dart';
import 'package:dartz/dartz.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource characterRemoteDataSource;
  CharacterRepositoryImpl({required this.characterRemoteDataSource});
  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharactersList(
      {required String animeId, required int page}) async {
    return await characterRemoteDataSource.getCharactersList(
        animeId: animeId, page: page);
  }

  @override
  Future<Either<Failure, CharacterEntity>> getCharacterById(
      {required String id}) async {
    return await characterRemoteDataSource.getCharacterById(id: id);
  }

  @override
  Future<Either<Failure, List<MediaCharacterEntity>>> getMediaCharactersList(
      {required String id, int page = 1}) async {
    return await characterRemoteDataSource.getMediaCharactersList(
        id: id, page: page);
  }
}
