import 'package:anime_app/features/reviews/domain/entities/reviewer_entity.dart';

class ReviewerModel extends ReviewerEntity {
  const ReviewerModel(
      {required super.id,
      required super.name,
      required super.imageUrl,
      required super.followersCount,
      required super.lifeSpentOnAnime,
      required super.ratingsCount});
  factory ReviewerModel.fromJson(Map<String, dynamic> json) {
    final attributes = json['data']['attributes'] as Map<String, dynamic>;

    return ReviewerModel(
      id: json['data']['id'] as String,
      name: attributes['name'] as String,
      imageUrl: attributes['avatar']['original'] as String,
      followersCount: attributes['followersCount'] as int,
      lifeSpentOnAnime: attributes['lifeSpentOnAnime'] as int,
      ratingsCount: attributes['ratingsCount'] as int,
    );
  }
}
