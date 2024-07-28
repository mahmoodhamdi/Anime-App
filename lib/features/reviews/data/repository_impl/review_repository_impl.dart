import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/reviews/data/data_sources/review_remote_data_source.dart';
import 'package:anime_app/features/reviews/data/models/reviewer_model.dart';
import 'package:anime_app/features/reviews/domain/entities/review_entity.dart';
import 'package:anime_app/features/reviews/domain/repository/review_repository.dart';
import 'package:dartz/dartz.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewRemoteDataSource reviewRemoteDataSource;

  ReviewRepositoryImpl({required this.reviewRemoteDataSource});

  @override
  Future<Either<Failure, List<ReviewerModel>>> getReviewersList(
      {required String animeId, int page = 1}) async {
    return await reviewRemoteDataSource.getReviewersList(
        animeId: animeId, page: page);
  }

  @override
  Future<Either<Failure, ReviewerModel>> getReviewer(
      {required String id}) async {
    return await reviewRemoteDataSource.getReviewerById(id: id);
  }

  @override
  Future<Either<Failure, List<ReviewEntity>>> getReviewsList(
      {required String animeId, required int page}) async {
    return await reviewRemoteDataSource.getReviewsList(
        animeId: animeId, page: page);
  }
}
