import 'package:anime_app/core/constants/app_colors.dart';
import 'package:anime_app/core/constants/app_text_styles.dart';
import 'package:anime_app/core/widgets/anime_card.dart';
import 'package:anime_app/core/widgets/app_dropdown_button_form_field.dart';
import 'package:anime_app/core/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class AnimeView extends StatelessWidget {
  const AnimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 64,
            horizontal: 120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Anime',
                style: AppTextStyles.heading1.copyWith(color: AppColors.grey50),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.3,
                height: MediaQuery.of(context).size.width*0.1,
                child: const AppDropdownButtonFormField()),
              const SizedBox(height: 24),
              Text(
                "120 items",
                style: AppTextStyles.bodyRegular
                    .copyWith(color: AppColors.grey400),
              ),
              const SizedBox(height: 24),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return const AnimeCard();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
