import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/reviews/domain/entities/review_entity.dart';
import 'package:anime_app/features/reviews/domain/repository/character_repository.dart';
import 'package:dartz/dartz.dart';

class GetReviewsListUsecase {
  final ReviewRepository reviewRepository;

  GetReviewsListUsecase({
    required this.reviewRepository,
  });

  Future<Either<Failure, List<ReviewEntity>>> call(
      {required String animeId, int page = 1}) async {
    return await reviewRepository.getReviews(animeId: animeId, page: page);
  }
}
