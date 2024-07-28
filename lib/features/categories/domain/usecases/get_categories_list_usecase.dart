import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/categories/domain/entities/category_entity.dart';
import 'package:anime_app/features/categories/domain/repository/category_repository.dart';
import 'package:dartz/dartz.dart';

class GetCategoriesListUsecase {
  final CategoryRepository categoryRepository;

  GetCategoriesListUsecase({
    required this.categoryRepository,
  });

  Future<Either<Failure, List<CategoryEntity>>> call(
      {required String animeId, int page = 1}) async {
    return await categoryRepository.getCategoriesList(
        animeId: animeId, page: page);
  }
}
