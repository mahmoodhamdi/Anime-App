import 'package:anime_app/core/constants/app_colors.dart';
import 'package:anime_app/core/constants/app_text_styles.dart';
import 'package:anime_app/core/widgets/anime_card.dart';
import 'package:anime_app/core/widgets/app_dropdown_button_form_field.dart';
import 'package:anime_app/core/widgets/app_scaffold.dart';
import 'package:anime_app/features/anime/presentation/controller/anime_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: const AppDropdownButtonFormField()),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              BlocBuilder<AnimeBloc, AnimeState>(
                builder: (context, state) {
                  if (state is AnimeError) {
                    return Text(state.failure.errorMessage);
                  }
                  if (state is AnimeLoaded) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemCount: state.animeList.length,
                      itemBuilder: (context, index) {
                        return AnimeCard(
                          anime: state.animeList[index],
                        );
                      },
                    );
                  }
                  return const CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
