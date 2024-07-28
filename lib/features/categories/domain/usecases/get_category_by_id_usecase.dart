import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/categories/domain/entities/category_entity.dart';
import 'package:anime_app/features/categories/domain/repository/category_repository.dart';
import 'package:dartz/dartz.dart';

class GetCategoryByIdUsecase {
  final CategoryRepository categoryRepository;

  GetCategoryByIdUsecase({
    required this.categoryRepository,
  });

  Future<Either<Failure, CategoryEntity>> call({required String id}) async {
    return await categoryRepository.getCategoryById(id: id);
  }
}
