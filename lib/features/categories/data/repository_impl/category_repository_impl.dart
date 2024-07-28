import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/categories/data/data_sources/category_remote_data_source.dart';
import 'package:anime_app/features/categories/domain/entities/category_entity.dart';
import 'package:anime_app/features/categories/domain/repository/category_repository.dart';
import 'package:dartz/dartz.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;
  CategoryRepositoryImpl({required this.categoryRemoteDataSource});
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategoriesList(
      {required String animeId, int page = 1}) async {
    return await categoryRemoteDataSource.getCategoriesList(
        animeId: animeId, page: page);
  }

  @override
  Future<Either<Failure, CategoryEntity>> getCategoryById(
      {required String id}) async {
    return await categoryRemoteDataSource.getCategoryById(id: id);
  }
}
