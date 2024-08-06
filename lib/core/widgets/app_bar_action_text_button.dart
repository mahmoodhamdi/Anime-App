import 'package:anime_app/core/constants/app_colors.dart';
import 'package:anime_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppBarActionTextButton extends StatelessWidget {
  const AppBarActionTextButton({
    super.key, required this.text, this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text,
          style: AppTextStyles.link.copyWith(color: AppColors.grey200)),
    );
  }
}
