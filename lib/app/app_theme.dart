import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_restaurant_app_example/app/app_colors.dart';

class AppTheme {
  AppTheme._();
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackgroundPink,
    accentColor: AppColors.aquaButtonColor,
    appBarTheme: AppBarTheme(
      color: AppColors.lightAppBarPink,
      iconTheme: IconThemeData(
        color: AppColors.darkPinkIcon,
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.darkPinkIcon,
    ),
    colorScheme: ColorScheme.light().copyWith(
      primary: AppColors.darkPinkIcon,
      secondary: AppColors.aquaButtonColor,
      secondaryVariant: AppColors.secondaryAquaColor,
    ),
    textTheme: TextTheme(
      headline3: GoogleFonts.dancingScript(
        color: AppColors.darkPinkIcon,
        fontWeight: FontWeight.bold,
      ),
      headline5: GoogleFonts.openSans(
        color: AppColors.whiteTextColor,
        fontWeight: FontWeight.w600,
      ),
      headline6: GoogleFonts.openSans(
        color: AppColors.subtitleWhiteTextColor,
      ),
    ),
  );
}
