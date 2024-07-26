import 'package:anime_app/core/dependency_injection/service_locator.dart';
import 'package:anime_app/features/anime/domain/usecases/get_anime_details_usecase.dart';
import 'package:anime_app/features/anime/domain/usecases/get_latest_anime_usecase.dart';
import 'package:anime_app/features/anime/domain/usecases/get_popular_anime_usecase.dart';
import 'package:anime_app/features/anime/domain/usecases/get_top_rated_anime_usecase.dart';
import 'package:anime_app/features/manga/domain/usecases/get_latest_manga_usecase.dart';
import 'package:anime_app/features/manga/domain/usecases/get_manga_details_usecase.dart';
import 'package:anime_app/features/manga/domain/usecases/get_popular_manga_usecase.dart';
import 'package:anime_app/features/manga/domain/usecases/get_top_rated_manga_usecase.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupServiceLocator();
  print("Starting...\n");
  print("Anime\n");
  var latestAnime = await getIt<GetLatestAnimeUsecase>().call();
  print("latestAnime\n");
  latestAnime.fold(
    (l) => print(l),
    (r) => print("Anime: ${r.first.title}\n"),
  );
  var popularAnime = await getIt<GetPopularAnimeUsecase>().call(page: 2);
  print("popularAnime\n");
  popularAnime.fold(
    (l) => print(l),
    (r) => print("Anime: ${r.first.title}\n"),
  );
  var topRatedAnime = await getIt<GetTopRatedAnimeUsecase>().call(page: 2);
  print("topRatedAnime\n");
  topRatedAnime.fold(
    (l) => print(l),
    (r) => print("Anime: ${r.first.title}\n"),
  );
  var getAnimeDetails = await getIt<GetAnimeDetailsUsecase>().call(1);
  print("getAnimeDetails\n");
  getAnimeDetails.fold(
    (l) => print(l),
    (r) => print("Anime: ${r.title}\n"),
  );

  print("Manga\n");
  var latestManga = await getIt<GetLatestMangaUsecase>().call();
  print("latestManga\n");
  latestManga.fold(
    (l) => print(l),
    (r) => print("Manga: ${r.first.title}\n"),
  );
  var popularManga = await getIt<GetPopularMangaUsecase>().call(page: 1);
  print("popularManga\n");
  popularManga.fold(
    (l) => print(l),
    (r) => print("Manga: ${r.first.title}\n"),
  );

  var topRatedManga = await getIt<GetTopRatedMangaUsecase>().call(page: 1);
  print("topRatedManga\n");
  topRatedManga.fold(
    (l) => print(l),
    (r) => print("Manga: ${r.first.title}\n"),
  );
  var getMangaDetails = await getIt<GetMangaDetailsUsecase>().call(1);
  print("getMangaDetails\n");
  getMangaDetails.fold(
    (l) => print(l),
    (r) => print("Manga: ${r.title}\n"),
  );

  print("Ending...\n");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Anime App',
      home: Scaffold(),
    );
  }
}
