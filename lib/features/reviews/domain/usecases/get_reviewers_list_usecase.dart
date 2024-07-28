import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/reviews/domain/entities/reviewer_entity.dart';
import 'package:anime_app/features/reviews/domain/repository/review_repository.dart';
import 'package:dartz/dartz.dart';

class GetReviewersListUsecase {
  final ReviewRepository reviewRepository;

  GetReviewersListUsecase({required this.reviewRepository});

  Future<Either<Failure, List<ReviewerEntity>>> call(
      {required String animeId, int page = 1}) async {
    return await reviewRepository.getReviewersList(
        animeId: animeId, page: page);
  }
}
