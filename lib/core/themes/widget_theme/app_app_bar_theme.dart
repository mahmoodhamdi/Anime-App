import 'package:anime_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppAppBarTheme {
  static const appAppBarTheme = AppBarTheme(
    color: AppColors.primary900,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.white100),
    titleTextStyle: TextStyle(
      color: AppColors.white100,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  );
}
