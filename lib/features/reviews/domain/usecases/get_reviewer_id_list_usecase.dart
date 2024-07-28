import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/reviews/domain/repository/character_repository.dart';
import 'package:dartz/dartz.dart';

class GetReviewerIdListUsecase {
  final ReviewRepository reviewRepository;

  GetReviewerIdListUsecase({required this.reviewRepository});

  Future<Either<Failure, List<String>>> call(
      {required String animeId, int page = 1}) async {
    return await reviewRepository.getReviewerIdList(
        animeId: animeId, page: page);
  }
}
