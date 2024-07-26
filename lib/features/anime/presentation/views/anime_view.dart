import 'package:anime_app/features/anime/presentation/controller/anime_bloc.dart';
import 'package:anime_app/features/anime/presentation/controller/anime_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeView extends StatelessWidget {
  const AnimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AnimeBloc()..add(const GetTopRatedAnimeEvent(page: 1)),
      child: Scaffold(
        body: Center(
          child: BlocBuilder<AnimeBloc, AnimeState>(
            builder: (context, state) {
              if (state is AnimeError) {
                return Text(state.failure.errorMessage);
              }
              if (state is AnimeLoaded) {
                return Text(state.animeList[0].title);
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
