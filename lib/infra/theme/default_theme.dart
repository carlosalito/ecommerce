import 'package:e_commerce_desafio/infra/theme/default_colors.dart';
import 'package:flutter/material.dart';

class CustomThemes {
  static final defaultTheme = ThemeData(
    fontFamily: "TTNormsPro",
    colorScheme: const ColorScheme(
      onBackground: Colors.white,
      onSecondary: AppColors.backgroundGray,
      onError: AppColors.errorColor,
      error: AppColors.errorColor,
      brightness: Brightness.light,
      onPrimary: AppColors.primaryColor,
      surface: AppColors.secondaryGray,
      secondary: AppColors.backgroundGray,
      primary: AppColors.primaryColor,
      onSurface: AppColors.secondaryGray,
      background: Colors.white,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: "RedHatDisplay",
        fontSize: 22.0,
        fontWeight: FontWeight.w900,
        color: AppColors.primaryGray,
      ),
      headline2: TextStyle(
        fontFamily: "RedHatDisplay",
        fontSize: 18.0,
        fontWeight: FontWeight.w900,
        color: AppColors.primaryGray,
      ),
      headline3: TextStyle(
        fontFamily: "RedHatDisplay",
        fontSize: 14.0,
        fontWeight: FontWeight.w900,
        color: AppColors.primaryColor,
      ),
      headline5: TextStyle(
        fontFamily: "TTNormsPro",
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: AppColors.secondaryGray,
      ),
      headline6: TextStyle(
        fontFamily: "TTNormsPro",
        fontSize: 11.0,
        fontWeight: FontWeight.w400,
        color: AppColors.secondaryGray,
      ),
    ),
  );
}
