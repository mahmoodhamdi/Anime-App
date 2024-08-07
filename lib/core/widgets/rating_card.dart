import 'package:anime_app/core/constants/app_colors.dart';
import 'package:anime_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({super.key, required this.rating});
  final String rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: AppColors.black65,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.star_outline_rounded,
              color: AppColors.warning500,
            ),
            const SizedBox(width: 4),
            Text(
              rating,
              style: AppTextStyles.bodyRegular
                  .copyWith(color: AppColors.warning500),
            ),
          ],
        ),
      ),
    );
  }
}
