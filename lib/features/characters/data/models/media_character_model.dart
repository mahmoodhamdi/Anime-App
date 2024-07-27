import 'package:anime_app/features/characters/domain/entities/media_character_entity.dart';

class MediaCharacterModel extends MediaCharacterEntity {
  const MediaCharacterModel({required super.id});

  factory MediaCharacterModel.fromJson(Map<String, dynamic> json) {
    return MediaCharacterModel(
      id: json['id'] as String,
    );
  }
}
