import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musick/config/theme/app_utils.dart';

final ThemeData myThemePlayfair = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColor.white,
  secondaryHeaderColor: AppColor.menuTab,
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: AppColor.navigationBarColor,
  ),
  // Define the text theme
  textTheme: TextTheme(
    titleLarge: GoogleFonts.roboto(
        fontSize: 24,

        letterSpacing: 1.3,
        color: AppColor.black),
    titleMedium: GoogleFonts.roboto(
        fontSize: 24,

        letterSpacing: 1.3,
        color: AppColor.black),
    displayLarge: GoogleFonts.roboto(
      fontSize: 22,

      color: AppColor.black,
    ),
    displayMedium: GoogleFonts.roboto(
      fontSize: 20,

      color: AppColor.black,
      letterSpacing: 1.3,
    ),
    displaySmall: GoogleFonts.roboto(
      fontSize: 16,

      color: AppColor.black,
      letterSpacing: 1.3,
    ),
    bodyLarge: GoogleFonts.roboto(
      fontSize: 14,

      color: AppColor.black,
      letterSpacing: 1.3,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 12,

      color: AppColor.black,
      letterSpacing: 1.3,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: 10,

      color: AppColor.black,
      letterSpacing: 1.3,
    ),
  ),
);
final ThemeData myThemelogo = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColor.white,
  secondaryHeaderColor: AppColor.menuTab,
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: AppColor.navigationBarColor,
  ),
  // Define the text theme
  textTheme: TextTheme(
    titleLarge: GoogleFonts.rubikBeastly(
        fontSize: 24,
        letterSpacing: 1.3,
        color: AppColor.black),

  ),
);