import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/characters/domain/entities/character_entity.dart';
import 'package:anime_app/features/characters/domain/repository/character_repository.dart';
import 'package:dartz/dartz.dart';

class GetCharacterByIdUsecase {
  final CharacterRepository characterRepository;

  GetCharacterByIdUsecase({
    required this.characterRepository,
  });

  Future<Either<Failure, CharacterEntity>> call({required String id}) async {
    return await characterRepository.getCharacterById(id: id);
  }
}
