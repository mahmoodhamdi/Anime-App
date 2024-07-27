import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/characters/domain/entities/character_entity.dart';
import 'package:anime_app/features/characters/domain/entities/media_character_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<MediaCharacterEntity>>> getMediaCharactersList(
      {required String id, int page = 1});

  Future<Either<Failure, List<CharacterEntity>>> getCharactersList(
      {required String animeId, required int page});

  Future<Either<Failure, CharacterEntity>> getCharacterById(
      {required String id});
}
