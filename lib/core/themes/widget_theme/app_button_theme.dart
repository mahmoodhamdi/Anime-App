import 'package:anime_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppButtonTheme {
  static ButtonThemeData buttonTheme = ButtonThemeData(
    buttonColor: AppColors.primary500,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0), // 12-pixel radius for buttons
    ),
  );
}
