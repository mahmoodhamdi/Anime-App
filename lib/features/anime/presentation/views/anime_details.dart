import 'package:anime_app/core/widgets/anime_cover_container.dart';
import 'package:anime_app/core/widgets/anime_title_container.dart';
import 'package:anime_app/core/widgets/app_app_bar.dart';
import 'package:anime_app/features/anime/domain/entities/anime_entity.dart';
import 'package:flutter/material.dart';

class AnimeDetails extends StatelessWidget {
  const AnimeDetails({super.key, required this.anime});
  final AnimeEntity anime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(120),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  AnimeCoverContainer(
                    coverImageUrl: anime.coverImageUrl,
                  ),
                  Positioned(
                    top: 400,
                    left: 120,
                    child: AnimeTitleContainer(
                      animeTitle: anime.title,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
