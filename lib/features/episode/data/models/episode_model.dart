import 'package:anime_app/features/episode/domain/entities/episode_entity.dart';

class EpisodeModel extends EpisodeEntity {
  const EpisodeModel({
    required super.id,
    required super.title,
    required super.description,
    required super.episodeNumber,
    required super.image,
    required super.length,
    required super.seasonNumber,
  });
  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'];
    return EpisodeModel(
      id: json['id'],
      title: attributes['canonicalTitle'],
      description: attributes['description'],
      episodeNumber: attributes['number'],
      image: attributes['thumbnail']['original'],
      length: attributes['length'],
      seasonNumber: attributes['seasonNumber'],
    );
  }
}
