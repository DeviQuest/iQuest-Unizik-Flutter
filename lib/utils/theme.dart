import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import './colors.dart' as color;


abstract class _LightColors {
  static const background = color.AppColors.lightModeBackground;
  static const card = color.AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = color.AppColors.darkModeBackground;
  static const card = color.AppColors.cardDark;
}

/// Reference to the application theme.
class AppTheme {
  static const accentColor = color.AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  final darkBase = ThemeData.dark();
  final lightBase = ThemeData.light();

  // Light theme and its settings.
  ThemeData get light => ThemeData(
    brightness: Brightness.light,
    colorScheme: lightBase.colorScheme.copyWith(secondary: accentColor),
    visualDensity: visualDensity,
    textTheme:
    GoogleFonts.asapTextTheme().apply(bodyColor: color.AppColors.textDark),
    backgroundColor: _LightColors.background,
    appBarTheme: lightBase.appBarTheme.copyWith(
      iconTheme: lightBase.iconTheme,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: color.AppColors.textDark,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    scaffoldBackgroundColor: _LightColors.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: color.AppColors.accentSecondary),
    ),
    cardColor: _LightColors.card,
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: color.AppColors.textDark),
    ),
    iconTheme: const IconThemeData(color: color.AppColors.iconDark),
  );

  /// Dark theme and its settings.
  ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    colorScheme: darkBase.colorScheme.copyWith(secondary: accentColor),
    visualDensity: visualDensity,
    textTheme:
    GoogleFonts.asapTextTheme().apply(bodyColor: color.AppColors.textLight),
    backgroundColor: _DarkColors.background,
    appBarTheme: darkBase.appBarTheme.copyWith(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    scaffoldBackgroundColor: _DarkColors.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: color.AppColors.accentSecondary),
    ),
    cardColor: _DarkColors.card,
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: color.AppColors.textLight),
    ),
    iconTheme: const IconThemeData(color: color.AppColors.iconLight),
  );
}