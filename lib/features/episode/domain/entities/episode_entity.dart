import 'package:equatable/equatable.dart';

class EpisodeEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String image;
  final int seasonNumber;
  final int episodeNumber;
  final int length;

  const EpisodeEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.seasonNumber,
    required this.episodeNumber,
    required this.length,
  });

  @override
  List<Object> get props => [
        id,
        title,
        description,
        image,
        seasonNumber,
        episodeNumber,
        length,
      ];
}
