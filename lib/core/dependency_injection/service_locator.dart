import 'package:anime_app/features/anime/data/data_sources/anime_remote_data_source.dart';
import 'package:anime_app/features/anime/data/repository_impl/anime_repository_impl.dart';
import 'package:anime_app/features/anime/domain/usecases/get_anime_details_usecase.dart';
import 'package:anime_app/features/anime/domain/usecases/get_latest_anime_usecase.dart';
import 'package:anime_app/features/anime/domain/usecases/get_popular_anime_usecase.dart';
import 'package:anime_app/features/anime/domain/usecases/get_top_rated_anime_usecase.dart';
import 'package:anime_app/features/characters/data/data_sources/character_remote_data_source.dart';
import 'package:anime_app/features/characters/data/repository_impl/character_repository_impl.dart';
import 'package:anime_app/features/characters/domain/usecases/get_character_by_id_usecase.dart';
import 'package:anime_app/features/characters/domain/usecases/get_characters_list_usecase.dart';
import 'package:anime_app/features/characters/domain/usecases/get_media_characters_list_usecase.dart';
import 'package:anime_app/features/manga/data/data_sources/manga_remote_data_source.dart';
import 'package:anime_app/features/manga/data/repository_impl/manga_repository_impl.dart';
import 'package:anime_app/features/manga/domain/usecases/get_latest_manga_usecase.dart';
import 'package:anime_app/features/manga/domain/usecases/get_manga_details_usecase.dart';
import 'package:anime_app/features/manga/domain/usecases/get_popular_manga_usecase.dart';
import 'package:anime_app/features/manga/domain/usecases/get_top_rated_manga_usecase.dart';
import 'package:anime_app/features/reviews/data/data_sources/review_remote_data_source.dart';
import 'package:anime_app/features/reviews/data/repository_impl/review_repository_impl.dart';
import 'package:anime_app/features/reviews/domain/usecases/get_reviewer_by_id_usecase.dart';
import 'package:anime_app/features/reviews/domain/usecases/get_reviewers_list_usecase.dart';
import 'package:anime_app/features/reviews/domain/usecases/get_reviews_list_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  //service
  getIt.registerSingleton<Dio>(Dio());

  //datasource for anime
  getIt.registerSingleton<AnimeRemoteDataSourceImpl>(
      AnimeRemoteDataSourceImpl(dio: getIt<Dio>()));
  //datasource for manga
  getIt.registerSingleton<MangaRemoteDataSourceImpl>(
      MangaRemoteDataSourceImpl(dio: getIt<Dio>()));
  //datasource for character
  getIt.registerSingleton<CharacterRemoteDataSourceImpl>(
      CharacterRemoteDataSourceImpl(dio: getIt<Dio>()));
  //datasource for review
  getIt.registerSingleton<ReviewRemoteDataSourceImpl>(
      ReviewRemoteDataSourceImpl(dio: getIt<Dio>()));

  //repository for anime
  getIt.registerSingleton<AnimeRepositoryImpl>(AnimeRepositoryImpl(
      animeRemoteDataSource: getIt<AnimeRemoteDataSourceImpl>()));
  //repository for manga
  getIt.registerSingleton<MangaRepositoryImpl>(MangaRepositoryImpl(
      mangaRemoteDataSource: getIt<MangaRemoteDataSourceImpl>()));
  //repository for character
  getIt.registerSingleton<CharacterRepositoryImpl>(CharacterRepositoryImpl(
      characterRemoteDataSource: getIt<CharacterRemoteDataSourceImpl>()));
  //repository for review
  getIt.registerSingleton<ReviewRepositoryImpl>(ReviewRepositoryImpl(
      reviewRemoteDataSource: getIt<ReviewRemoteDataSourceImpl>()));

  //usecases for anime
  getIt.registerSingleton<GetTopRatedAnimeUsecase>(GetTopRatedAnimeUsecase(
    animeRepository: getIt<AnimeRepositoryImpl>(),
  ));
  getIt.registerSingleton<GetPopularAnimeUsecase>(GetPopularAnimeUsecase(
    animeRepository: getIt<AnimeRepositoryImpl>(),
  ));
  getIt.registerSingleton<GetLatestAnimeUsecase>(GetLatestAnimeUsecase(
    animeRepository: getIt<AnimeRepositoryImpl>(),
  ));
  getIt.registerSingleton<GetAnimeDetailsUsecase>(GetAnimeDetailsUsecase(
    animeRepository: getIt<AnimeRepositoryImpl>(),
  ));

  //usecases for manga
  getIt.registerSingleton<GetLatestMangaUsecase>(GetLatestMangaUsecase(
    mangaRepository: getIt<MangaRepositoryImpl>(),
  ));
  getIt.registerSingleton<GetTopRatedMangaUsecase>(GetTopRatedMangaUsecase(
    mangaRepository: getIt<MangaRepositoryImpl>(),
  ));
  getIt.registerSingleton<GetPopularMangaUsecase>(GetPopularMangaUsecase(
    mangaRepository: getIt<MangaRepositoryImpl>(),
  ));
  getIt.registerSingleton<GetMangaDetailsUsecase>(GetMangaDetailsUsecase(
    mangaRepository: getIt<MangaRepositoryImpl>(),
  ));

  //usecases for character
  getIt.registerSingleton<GetCharacterByIdUsecase>(GetCharacterByIdUsecase(
    characterRepository: getIt<CharacterRepositoryImpl>(),
  ));
  getIt.registerSingleton<GetCharactersListUsecase>(GetCharactersListUsecase(
    characterRepository: getIt<CharacterRepositoryImpl>(),
  ));
  getIt.registerSingleton<GetMediaCharactersListUsecase>(
      GetMediaCharactersListUsecase(
    characterRepository: getIt<CharacterRepositoryImpl>(),
  ));

  //usecases for review
  getIt.registerSingleton<GetReviewsListUsecase>(GetReviewsListUsecase(
    reviewRepository: getIt<ReviewRepositoryImpl>(),
  ));

  getIt.registerSingleton<GetReviewerByIdUsecase>(GetReviewerByIdUsecase(
    reviewRepository: getIt<ReviewRepositoryImpl>(),
  ));

  getIt.registerSingleton<GetReviewersListUsecase>(GetReviewersListUsecase(
    reviewRepository: getIt<ReviewRepositoryImpl>(),
  ));
}
