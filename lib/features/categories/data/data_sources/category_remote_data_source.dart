import 'package:anime_app/core/constants/api_constants.dart';
import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/categories/data/models/category_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CategoryRemoteDataSource {
  Future<Either<Failure, List<CategoryModel>>> getCategoriesList(
      {required String animeId, int page = 1});

  Future<Either<Failure, CategoryModel>> getCategoryById({required String id});
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final Dio _dio;

  CategoryRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategoriesList(
      {required String animeId, int page = 1}) async {
    try {
      final response = await _dio.get(
        '$categoryByAnimeId$animeId$afterCategoryAnimeId',
      );
      final categories = (response.data['data'] as List)
          .map((json) => CategoryModel.fromJson(json))
          .toList();
      return Right(categories);
    } on DioException catch (dioException) {
      return Left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoryModel>> getCategoryById(
      {required String id}) async {
    try {
      final response = await _dio.get(
        '$categoryById$id',
      );
      final category = CategoryModel.fromJson(response.data['data']);
      return Right(category);
    } on DioException catch (dioException) {
      return Left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
