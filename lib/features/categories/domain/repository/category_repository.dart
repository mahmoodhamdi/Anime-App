import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/categories/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategoriesList(
      {String animeId, int page});

  Future<Either<Failure, CategoryEntity>> getCategoryById({required String id});
}
