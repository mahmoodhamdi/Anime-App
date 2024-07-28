import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final String id;
  final num rating;
  final num likesCount;
  final String content;
  final String createdAt;

  const ReviewEntity({
    required this.id,
    required this.rating,
    required this.likesCount,
    required this.content,
    required this.createdAt,
  });

  @override 
  List<Object?> get props => [id, rating, likesCount, content, createdAt];
}
