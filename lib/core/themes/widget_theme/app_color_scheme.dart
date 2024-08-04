import 'package:anime_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppColorScheme {
  static const ColorScheme appColorScheme = ColorScheme.dark(
    primary: AppColors.primary500,
    primaryContainer: AppColors.primary700,
    secondary: AppColors.secondary500,
    secondaryContainer: AppColors.secondary700,
    surface: AppColors.primary800,
    onPrimary: AppColors.white100,
    onSecondary: AppColors.white100,
    onSurface: AppColors.white100,
    error: AppColors.error500,
    onError: AppColors.white100,
  );
}
