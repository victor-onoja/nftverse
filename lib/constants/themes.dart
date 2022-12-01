import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = _themeData(_lightColorScheme);

  static _themeData(ColorScheme colorScheme) => ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme:
            const AppBarTheme(centerTitle: false, color: AppColors.button),
        colorScheme: colorScheme,
        textTheme: GoogleFonts.syneMonoTextTheme(
          _textTheme(colorScheme),
        ),
      );

  static final ColorScheme _lightColorScheme =
      const ColorScheme.light().copyWith(primary: AppColors.text);

  static TextTheme _textTheme(ColorScheme colorScheme) => TextTheme(
      bodyText1: TextStyle(
          color: colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 16));
}
