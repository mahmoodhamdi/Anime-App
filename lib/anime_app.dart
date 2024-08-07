import 'package:anime_app/core/dependency_injection/service_locator.dart';
import 'package:anime_app/core/themes/app_theme/app_theme.dart';
import 'package:anime_app/features/anime/presentation/controller/anime_bloc.dart';
import 'package:anime_app/features/anime/presentation/controller/anime_event.dart';
import 'package:anime_app/features/anime/presentation/views/anime_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeApp extends StatelessWidget {
  const AnimeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      title: 'Anime App',
      home: BlocProvider(
        create: (context) =>
            getIt<AnimeBloc>()..add(const GetLatestAnimeEvent(page: 1)),
        child: const AnimeView(),
      ),
    );
  }
}
