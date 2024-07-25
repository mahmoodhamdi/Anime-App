import 'package:anime_app/features/anime/domain/entities/anime_entity.dart';

class AnimeModel extends AnimeEntity {
  const AnimeModel(
      {required super.id,
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
      required super.type});

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'];

    return AnimeModel(
      id: json['id'],
      title: attributes['titles']['en'],
      imageUrl: attributes['posterImage']['tiny'],
      coverImageUrl: attributes['coverImage']['tiny'],
      description: attributes['description'],
      rating: attributes['averageRating'],
      status: attributes['status'],
      createdAt: (attributes['createdAt']),
      episodeLength: attributes['episodeLength'],
      episodesCount: attributes['episodeCount'],
      ranking: attributes['popularityRank'],
      type: attributes['subtype'],
    );
  }
}
