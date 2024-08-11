import 'package:equatable/equatable.dart';

class AnimeEntity extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final String coverImageUrl;
  final String description;
  final num ranking;
  final String rating;
  final String type;
  final String status;
  final num episodesCount;
  final String createdAt;
  final num totalLength;
  final String ageRatingGuide;

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
      required this.totalLength
      ,
      required this.ageRatingGuide});

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
        totalLength,
        coverImageUrl
      ];
}
