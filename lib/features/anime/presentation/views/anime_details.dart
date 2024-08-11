import 'package:anime_app/core/widgets/anime_cover_container.dart';
import 'package:anime_app/core/widgets/anime_title_container.dart';
import 'package:anime_app/core/widgets/app_scaffold.dart';
import 'package:anime_app/core/widgets/rating_card.dart';
import 'package:anime_app/features/anime/domain/entities/anime_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeDetails extends StatelessWidget {
  const AnimeDetails({super.key, required this.anime});
  final AnimeEntity anime;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: SingleChildScrollView(
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
              ),
              const SizedBox(height: 120),
              Row(
                children: [
                  Container(
                    width: 480,
                    height: 720,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            anime.coverImageUrl == ""
                                ? anime.imageUrl
                                : anime.coverImageUrl),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          anime.title,
                          style: const TextStyle(
                            color: Color(0xFFEBEEF5),
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          anime.description,
                          maxLines: 6,
                          style: const TextStyle(
                            color: Color(0xFF8D95A9),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 24),
                        RatingCard(rating: anime.rating),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Release Date:',
                                  style: TextStyle(
                                    color: Color(0xFF767E94),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  anime.createdAt,
                                  style: const TextStyle(
                                    color: Color(0xFFC3C8D4),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 24),
                            
                            Column(
                              children: [
                                const Text(
                                  'Rank',
                                  style: TextStyle(
                                    color: Color(0xFF767E94),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                const SizedBox(height: 8),
                                Text(
                                  '${anime.ranking}',
                                  style: const TextStyle(
                                    color: Color(0xFFC3C8D4),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'No. of episodes',
                                  style: TextStyle(
                                    color: Color(0xFF767E94),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${anime.episodesCount}',
                                  style: const TextStyle(
                                    color: Color(0xFFC3C8D4),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 24),
                            Column(children: [
                              const Text(
                                'Duration',
                                style: TextStyle(
                                  color: Color(0xFF767E94),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text('${anime.totalLength} min',
                                  style: const TextStyle(
                                    color: Color(0xFFC3C8D4),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ))
                            ])
                          ],
                        ),
                        const SizedBox(height: 24),
                        const SizedBox(height: 24),
                        const Text(
                          'Genres',
                          style: TextStyle(
                            color: Color(0xFF767E94),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Adventure,  Science Fiction, Action',
                          style: TextStyle(
                            color: Color(0xFFC3C8D4),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
