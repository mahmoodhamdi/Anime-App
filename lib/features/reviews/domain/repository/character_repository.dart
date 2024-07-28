import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/reviews/domain/entities/review_entity.dart';
import 'package:anime_app/features/reviews/domain/entities/reviewer_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ReviewRepository {
  Future<Either<Failure, List<ReviewEntity>>> getReviews(
      {required String animeId, required int page});

  Future<Either<Failure, ReviewerEntity>> getReviewer({required String id});

  Future<Either<Failure, List<String>>> getReviewerIdList(
      {required String animeId, required int page});
}
