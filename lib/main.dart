import 'package:anime_app/core/dependency_injection/service_locator.dart';
import 'package:anime_app/features/anime/presentation/views/anime_view.dart';
import 'package:anime_app/features/episode/data/data_sources/episode_remote_data_source.dart';
import 'package:anime_app/features/episode/data/repository_impl/episode_repository_impl.dart';
import 'package:anime_app/features/episode/domain/usecases/get_episode_by_id_usecase.dart';
import 'package:anime_app/features/episode/domain/usecases/get_episodes_list_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupServiceLocator();
  var episode = await GetEpisodeByIdUsecase(
      episodeRepository: EpisodeRepositoryImpl(
          episodeRemoteDataSource: EpisodeRemoteDataSourceImpl(
    dio: Dio(),
  ))).call(id: '104939');
  episode.fold((l) => print(l), (r) => print("Episode: ${r.title}"));
  var episodes = await GetEpisodesListUsecase(
      episodeRepository: EpisodeRepositoryImpl(
          episodeRemoteDataSource: EpisodeRemoteDataSourceImpl(
    dio: Dio(),
  ))).call(animeId: "7442", page: 1);
  episodes.fold((l) => print(l), (r) => print("Episodes: ${r.length}"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Anime App',
      home: AnimeView(),
    );
  }
}
