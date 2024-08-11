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
    required super.totalLength,
    required super.episodesCount,
    required super.ranking,
    required super.coverImageUrl,
    required super.type,
    required super.ageRatingGuide,
    required super.episodeLength,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'] ?? {};

    return AnimeModel(
      id: json['id'] ?? '',
      title: attributes['titles']?['en'] ?? 'Unknown Title',
      imageUrl: attributes['posterImage']?['original'] ?? '',
      coverImageUrl: attributes['coverImage']?['original'] ?? '',
      description: attributes['description'] ?? 'No description available',
      rating: attributes['averageRating'] ?? '0.0',
      status: attributes['status'] ?? 'Unknown',
      createdAt: attributes['createdAt'].toString().substring(0, 10),
      totalLength: attributes['totalLength'] ?? 0,
      episodesCount: attributes['episodeCount'] ?? 0,
      episodeLength: attributes['episodeLength'] ?? 0,
      ranking: attributes['popularityRank'] ?? 0,
      type: attributes['subtype'] ?? 'Unknown',
      ageRatingGuide:attributes['ageRatingGuide'] ?? 'Unknown',
    );
  }
}
