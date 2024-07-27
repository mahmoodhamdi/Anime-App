import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/characters/domain/entities/media_character_entity.dart';
import 'package:anime_app/features/characters/domain/repository/character_repository.dart';
import 'package:dartz/dartz.dart';

class GetMediaCharactersListUsecase {
  final CharacterRepository characterRepository;

  GetMediaCharactersListUsecase({required this.characterRepository});

  Future<Either<Failure, List<MediaCharacterEntity>>> call(
      {required String id, int page = 1}) async {
    return await characterRepository.getMediaCharactersList(id: id, page: page);
  }
}
