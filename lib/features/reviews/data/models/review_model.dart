import 'package:anime_app/features/reviews/domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  const ReviewModel({
    required super.id,
    required super.content,
    required super.rating,
    required super.createdAt,
    required super.likesCount,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'] as Map<String, dynamic>;

    return ReviewModel(
      id: json['id'] as String,
      content: attributes['content'] as String? ??
          '', // Default to empty string if null
      rating: attributes['rating'] as num,
      createdAt: attributes['createdAt'] as String,
      likesCount: attributes['likesCount'] as num,
    );
  }
}
