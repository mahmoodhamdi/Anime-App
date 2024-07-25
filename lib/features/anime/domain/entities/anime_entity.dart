import 'package:equatable/equatable.dart';

class AnimeEntity extends Equatable {
  final int id;
  final String title;
  final String imageUrl;
  final String coverImageUrl;
  final String description;
  final String ranking;
  final String rating;
  final String type;
  final String status;
  final String episodesCount;
  final String createdAt;
  final String episodeLength;

  const AnimeEntity(
      {required this.id,
      required this.title,
      required this.coverImageUrl,
      required this.imageUrl,
      required this.description,
      required this.ranking,
      required this.rating,
      required this.type,
      required this.status,
      required this.episodesCount,
      required this.createdAt,
      required this.episodeLength});

  @override
  List<Object?> get props => [
        id,
        title,
        imageUrl,
        description,
        ranking,
        rating,
        type,
        status,
        episodesCount,
        createdAt,
        episodeLength,
        coverImageUrl
      ];
}
