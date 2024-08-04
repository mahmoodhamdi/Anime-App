import 'package:anime_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme textTheme = const TextTheme(
    displayLarge: TextStyle(
      color: AppColors.white100,
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: AppColors.white100,
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: AppColors.white100,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: AppColors.white100,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      color: AppColors.white100,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      color: AppColors.white100,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      color: AppColors.white100,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
    ), // Regular body text in white
    bodyMedium: TextStyle(
      color: AppColors.white100,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
    titleMedium: TextStyle(
      color: AppColors.white100,
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
    ),
    titleSmall: TextStyle(
      color: AppColors.white100,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      color: AppColors.grey400,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
    labelLarge: TextStyle(
      color: AppColors.white100,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
    ),
    labelSmall: TextStyle(
      color: AppColors.grey400,
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
    ),
  );
}
