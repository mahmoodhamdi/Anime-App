import 'package:anime_app/features/anime/data/data_sources/anime_remote_data_source.dart';
import 'package:anime_app/features/anime/data/repository_impl/anime_repository_impl.dart';
import 'package:anime_app/features/anime/domain/usecases/get_anime_details_usecase.dart';
import 'package:anime_app/features/anime/domain/usecases/get_latest_anime_usecase.dart';
import 'package:anime_app/features/anime/domain/usecases/get_popular_anime_usecase.dart';
import 'package:anime_app/features/anime/domain/usecases/get_top_rated_anime_usecase.dart';
import 'package:anime_app/features/manga/data/data_sources/manga_remote_data_source.dart';
import 'package:anime_app/features/manga/data/repository_impl/manga_repository_impl.dart';
import 'package:anime_app/features/manga/domain/usecases/get_latest_manga_usecase.dart';
import 'package:anime_app/features/manga/domain/usecases/get_manga_details_usecase.dart';
import 'package:anime_app/features/manga/domain/usecases/get_popular_manga_usecase.dart';
import 'package:anime_app/features/manga/domain/usecases/get_top_rated_manga_usecase.dart';
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

  //repository for anime
  getIt.registerSingleton<AnimeRepositoryImpl>(AnimeRepositoryImpl(
      animeRemoteDataSource: getIt<AnimeRemoteDataSourceImpl>()));
  //repository for manga
  getIt.registerSingleton<MangaRepositoryImpl>(MangaRepositoryImpl(
      mangaRemoteDataSource: getIt<MangaRemoteDataSourceImpl>()));
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
}
