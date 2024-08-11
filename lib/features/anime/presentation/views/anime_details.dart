import 'package:anime_app/core/constants/app_colors.dart';
import 'package:anime_app/core/constants/app_text_styles.dart';
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
                    coverImageUrl: anime.coverImageUrl == ""
                        ? anime.imageUrl
                        : anime.coverImageUrl,
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
                        image: CachedNetworkImageProvider(anime.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            anime.title,
                            style: AppTextStyles.heading4.copyWith(
                              color: AppColors.grey50,
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              anime.description,
                              textAlign: TextAlign.justify,
                              maxLines: 9,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: AppColors.grey300,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          RatingCard(rating: anime.rating.toString()),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Type',
                                          style: AppTextStyles.bodyRegular
                                              .copyWith(
                                            color: AppColors.grey400,
                                          )),
                                      const SizedBox(height: 8),
                                      Text(
                                        anime.type,
                                        style: AppTextStyles.bodyLarge.copyWith(
                                          color: AppColors.grey100,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Status',
                                          style: AppTextStyles.bodyRegular
                                              .copyWith(
                                            color: AppColors.grey400,
                                          )),
                                      const SizedBox(height: 8),
                                      Text(
                                        anime.status,
                                        style: AppTextStyles.bodyLarge.copyWith(
                                          color: AppColors.grey100,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'First air date',
                                        style:
                                            AppTextStyles.bodyRegular.copyWith(
                                          color: AppColors.grey400,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(anime.createdAt,
                                          style:
                                              AppTextStyles.bodyLarge.copyWith(
                                            color: AppColors.grey100,
                                          )),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Age Rating',
                                          style: AppTextStyles.bodyRegular
                                              .copyWith(
                                            color: AppColors.grey400,
                                          )),
                                      const SizedBox(height: 8),
                                      Text(
                                        anime.ageRatingGuide,
                                        style: AppTextStyles.bodyLarge.copyWith(
                                          color: AppColors.grey100,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('No. of Episodes',
                                          style: AppTextStyles.bodyRegular
                                              .copyWith(
                                            color: AppColors.grey400,
                                          )),
                                      const SizedBox(height: 8),
                                      Text(
                                        anime.episodesCount.toString(),
                                        style: AppTextStyles.bodyLarge.copyWith(
                                          color: AppColors.grey100,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Episode Duration',
                                        style: AppTextStyles.bodyRegular
                                            .copyWith(color: AppColors.grey400),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "${anime.episodeLength.toString()} Minutes",
                                        style: AppTextStyles.bodyLarge
                                            .copyWith(color: AppColors.grey100),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                anime.ranking.toString(),
                                style: const TextStyle(
                                  color: Color(0xFFC3C8D4),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          const Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Genres',
                                style: TextStyle(
                                  color: Color(0xFF767E94),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Action & Adventure, Sci-Fi & Fantasy, Drama',
                                style: TextStyle(
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
