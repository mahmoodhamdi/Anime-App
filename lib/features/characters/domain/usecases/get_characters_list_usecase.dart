import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/characters/domain/entities/character_entity.dart';
import 'package:anime_app/features/characters/domain/repository/character_repository.dart';
import 'package:dartz/dartz.dart';

class GetCharactersListUsecase {
  final CharacterRepository characterRepository;

  GetCharactersListUsecase({
    required this.characterRepository,
  });

  Future<Either<Failure, List<CharacterEntity>>> call(
      {required int animeId, int page = 1}) async {
    return await characterRepository.getCharactersList(
        animeId: animeId, page: page);
  }
}
