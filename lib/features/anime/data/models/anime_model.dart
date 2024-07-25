import 'package:anime_app/features/anime/domain/entities/anime_entity.dart';

class AnimeModel extends AnimeEntity {
  const AnimeModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.description,
    required super.rating,
    required super.status,
    required super.createdAt,
    required super.episodeLength,
    required super.episodesCount,
    required super.ranking,
    required super.coverImageUrl,
    required super.type,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'] ?? {};

    return AnimeModel(
      id: json['id'] ?? '',
      title: attributes['titles']?['en'] ?? 'Unknown Title',
      imageUrl: attributes['posterImage']?['tiny'] ?? '',
      coverImageUrl: attributes['coverImage']?['tiny'] ?? '',
      description: attributes['description'] ?? 'No description available',
      rating: attributes['averageRating'] ?? '0.0',
      status: attributes['status'] ?? 'Unknown',
      createdAt: attributes['createdAt'] ?? '',
      episodeLength: attributes['episodeLength'] ?? 0,
      episodesCount: attributes['episodeCount'] ?? 0,
      ranking: attributes['popularityRank'] ?? 0,
      type: attributes['subtype'] ?? 'Unknown',
    );
  }
}
