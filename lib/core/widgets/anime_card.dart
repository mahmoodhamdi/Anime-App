import 'package:anime_app/core/constants/app_colors.dart';
import 'package:anime_app/core/constants/app_text_styles.dart';
import 'package:anime_app/core/widgets/rating_card.dart';
import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: AppColors.grey800.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "assets/images/small.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 4,
                    top: 8,
                    child: RatingCard(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Shang Chi',
                  style: AppTextStyles.link.copyWith(color: AppColors.grey50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
