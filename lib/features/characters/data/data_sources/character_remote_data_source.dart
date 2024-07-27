import 'package:anime_app/core/constants/api_constants.dart';
import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/characters/data/models/character_model.dart';
import 'package:anime_app/features/characters/data/models/media_character_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CharacterRemoteDataSource {
  Future<Either<Failure, CharacterModel>> getCharacterById(
      {required String id});

  Future<Either<Failure, List<CharacterModel>>> getCharactersList(
      {required String animeId, int page = 1});

  Future<Either<Failure, List<MediaCharacterModel>>> getMediaCharactersList(
      {required String id, int page = 1});
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final Dio _dio;

  CharacterRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<Failure, List<MediaCharacterModel>>> getMediaCharactersList(
      {required String id, int page = 1}) async {
    List<MediaCharacterModel> characters = [];
    try {
      final response = await _dio.get(
        '$characterByAnimeId$id$afterCharacterByAnimeId',
      );

      if (response.statusCode == 200) {
        response.data['data'].forEach((element) {
          final character = MediaCharacterModel.fromJson(element);
          characters.add(character);
        });

        return Right(characters);
      } else {
        return Left(
            ServerFailure.fromStatusCode(response.statusCode!, response.data));
      }
    } on DioException catch (dioException) {
      return Left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CharacterModel>>> getCharactersList(
      {required String animeId, int page = 1}) async {
    List<String> ids = [];

    try {
      var characters = await getMediaCharactersList(id: animeId);

      characters.fold((l) => throw l, (r) {
        for (var element in r) {
          ids.add(element.id);
        }
      });
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }

    List<CharacterModel> characters = [];
    try {
      for (var id in ids) {
        final response = await getCharacterById(id: id);
        response.fold((l) => throw l, (r) {
          characters.add(r);
        });
      }

      return Right(characters);
    } on DioException catch (dioException) {
      return Left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CharacterModel>> getCharacterById(
      {required String id}) async {
    int characterId = int.parse(id);
    try {
      final response = await _dio.get(
        '$characterById$characterId$afterCharacterId',
      );

      if (response.statusCode == 200) {
        final character = CharacterModel.fromJson(response.data);
        return Right(character);
      } else {
        return Left(
            ServerFailure.fromStatusCode(response.statusCode!, response.data));
      }
    } on DioException catch (dioException) {
      return Left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
