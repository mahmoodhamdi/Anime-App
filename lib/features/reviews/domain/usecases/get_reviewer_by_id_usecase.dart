import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/reviews/domain/entities/reviewer_entity.dart';
import 'package:anime_app/features/reviews/domain/repository/character_repository.dart';
import 'package:dartz/dartz.dart';

class GetReviewerByIdUsecase {
  final ReviewRepository reviewRepository;

  GetReviewerByIdUsecase({
    required this.reviewRepository,
  });

  Future<Either<Failure, ReviewerEntity>> call({required String id}) async {
    return await reviewRepository.getReviewer(id: id);
  }
}
