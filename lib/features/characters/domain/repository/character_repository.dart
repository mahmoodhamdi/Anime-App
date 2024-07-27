import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/characters/domain/entities/character_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<CharacterEntity>>> getCharacters(
      {required int page});
}
