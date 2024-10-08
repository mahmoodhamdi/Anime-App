import 'package:anime_app/features/manga/domain/entities/manga_entity.dart';

class MangaModel extends MangaEntity {
  const MangaModel({
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

  factory MangaModel.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'] ?? {};

    return MangaModel(
      id: json['id'] ?? '',
      title: attributes['titles']?['en'] ??
          attributes['titles']?['en_jp'] ??
          attributes['titles']?['en_us'] ??
          'Unknown Title',
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
