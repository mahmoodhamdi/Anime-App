import 'package:anime_app/features/characters/domain/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
  });

  // Factory constructor to create a CharacterModel from JSON
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    final attributes = json['data']['attributes'];
    return CharacterModel(
      id: json['data']['id'],
      name: attributes['name'],
      description: attributes['description'],
      imageUrl: attributes['image']['original'],
    );
  }
}
