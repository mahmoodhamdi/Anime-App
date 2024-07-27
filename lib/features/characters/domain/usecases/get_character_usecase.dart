import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/characters/domain/entities/character_entity.dart';
import 'package:anime_app/features/characters/domain/repository/character_repository.dart';
import 'package:dartz/dartz.dart';

class GetCharacterUsecase {
  final CharacterRepository characterRepository;

  GetCharacterUsecase({
    required this.characterRepository,
  });

  Future<Either<Failure, List<CharacterEntity>>> call({int page = 1}) async {
    return await characterRepository.getCharacters(page: page);
  }
}
