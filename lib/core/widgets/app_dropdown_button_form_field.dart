import 'package:anime_app/core/constants/app_colors.dart';
import 'package:anime_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppDropdownButtonFormField extends StatelessWidget {
  const AppDropdownButtonFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: "Latest Episodes",
      onChanged: (String? newValue) {},

      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        filled: true,
        fillColor: AppColors.grey900,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.grey300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.grey300),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.error300),
        ),
      ),

      dropdownColor: AppColors.grey900,
      icon: const Icon(Icons.sort, color: AppColors.grey300),

      style: const TextStyle(color: AppColors.grey400), // Updated style
      items: <String>['Latest Episodes', 'Popular', 'Top Rated']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: AppTextStyles.bodyRegular, // Updated text color
          ),
        );
      }).toList(),
    );
  }
}
