import 'package:anime_app/core/constants/api_constants.dart';
import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/Reviews/data/models/Review_model.dart';
import 'package:anime_app/features/reviews/data/models/reviewer_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class ReviewRemoteDataSource {
  Future<Either<Failure, ReviewerModel>> getReviewerById({required String id});

  Future<Either<Failure, List<ReviewModel>>> getReviewsList(
      {required String animeId, int page = 1});

  Future<Either<Failure, List<ReviewerModel>>> getReviewersList(
      {required String animeId, int page = 1});
}

class ReviewRemoteDataSourceImpl implements ReviewRemoteDataSource {
  final Dio _dio;

  ReviewRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<Failure, ReviewerModel>> getReviewerById(
      {required String id}) async {
    try {
      final response = await _dio.get(
        "$reviewerByReviewId$id$afterReviewerId",
      );
      final reviewer = ReviewerModel.fromJson(response.data);
      return Right(reviewer);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReviewModel>>> getReviewsList(
      {required String animeId, int page = 1}) async {
    try {
      final response = await _dio.get(
        "$reviewByAnimeId$animeId$afterReviewByAnimeId",
      );

      final reviews = (response.data['data'] as List)
          .map((e) => ReviewModel.fromJson(e))
          .toList();

      return Right(reviews);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReviewerModel>>> getReviewersList(
      {required String animeId, int page = 1}) async {
    try {
      List<String> ids = [];

      List<ReviewerModel> reviewers = [];
      var response = await getReviewsList(animeId: animeId, page: page);

      response.fold((l) => throw l, (r) {
        for (var element in r) {
          ids.add(element.id);
        }
      });
      for (var id in ids) {
        final response = await getReviewerById(id: id);
        response.fold((l) => throw l, (r) {
          reviewers.add(r);
        });
      }

      return Right(reviewers);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
