import 'package:anime_app/core/constants/app_colors.dart';
import 'package:anime_app/core/themes/widget_theme/app_app_bar_theme.dart';
import 'package:anime_app/core/themes/widget_theme/app_button_theme.dart';
import 'package:anime_app/core/themes/widget_theme/app_color_scheme.dart';
import 'package:anime_app/core/themes/widget_theme/app_icon_theme.dart';
import 'package:anime_app/core/themes/widget_theme/app_input_decoration_theme.dart';
import 'package:anime_app/core/themes/widget_theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      brightness: Brightness.dark,

      // Primary and secondary color palettes
      primaryColor: AppColors.primary500,
      primaryColorLight: AppColors.primary400,
      primaryColorDark: AppColors.primary700,

      // Define the color scheme
      colorScheme: AppColorScheme.appColorScheme,

      // Typography settings
      textTheme: AppTextTheme.textTheme,

      // Button theme settings
      buttonTheme: AppButtonTheme.buttonTheme,

      // Input decoration theme settings
      inputDecorationTheme: AppInputDecorationTheme.inputDecorationTheme,

      // AppBar theme settings
      appBarTheme: AppAppBarTheme.appAppBarTheme,

      // Icon theme settings
      iconTheme: AppIconTheme.iconTheme);
}
