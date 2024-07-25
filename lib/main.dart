import 'package:anime_app/core/dependency_injection/service_locator.dart';
import 'package:anime_app/features/anime/domain/usecases/get_anime_details_usecase.dart';
import 'package:anime_app/features/anime/domain/usecases/get_latest_anime_usecase.dart';
import 'package:anime_app/features/anime/domain/usecases/get_popular_anime_usecase.dart';
import 'package:anime_app/features/anime/domain/usecases/get_top_rated_anime_usecase.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupServiceLocator();
  print("Starting...");
  var latestAnime = await getIt<GetLatestAnimeUsecase>().call();
  print("latestAnime\n");
  latestAnime.fold(
    (l) => print(l),
    (r) => print("Anime: ${r.first.title}\nRating: ${r.first.rating}"),
  );
  var popularAnime = await getIt<GetPopularAnimeUsecase>().call();
  print("popularAnime\n");
  popularAnime.fold(
    (l) => print(l),
    (r) => print("Anime: ${r.first.title}\nRating: ${r.first.rating}"),
  );
  var topRatedAnime = await getIt<GetTopRatedAnimeUsecase>().call();
  print("topRatedAnime\n");
  topRatedAnime.fold(
    (l) => print(l),
    (r) => print("Anime: ${r.first.title}\nRating: ${r.first.rating}"),
  );
  var getAnimeDetails = await getIt<GetAnimeDetailsUsecase>().call(1);
  print("getAnimeDetails\n");
  getAnimeDetails.fold(
    (l) => print(l),
    (r) => print("Anime: ${r.title}\nRating: ${r.rating}"),
  );

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
