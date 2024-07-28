import 'package:equatable/equatable.dart';

class ReviewerEntity extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final num lifeSpentOnAnime;
  final num ratingsCount;
  final num followersCount;

  const ReviewerEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.lifeSpentOnAnime,
    required this.ratingsCount,
    required this.followersCount,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        lifeSpentOnAnime,
        ratingsCount,
        followersCount,
      ];
}
