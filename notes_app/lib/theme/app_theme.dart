import 'package:flutter/material.dart';
import 'colors.dart';

enum AppThemeType {
  defaultTheme,
  ocean,
  forest,
  sunset,
  lavender,
  mocha,
}

class AppTheme {
  static ThemeData getTheme(AppThemeType themeType, bool isDark) {
    switch (themeType) {
      case AppThemeType.ocean:
        return isDark ? _oceanDark : _oceanLight;
      case AppThemeType.forest:
        return isDark ? _forestDark : _forestLight;
      case AppThemeType.sunset:
        return isDark ? _sunsetDark : _sunsetLight;
      case AppThemeType.lavender:
        return isDark ? _lavenderDark : _lavenderLight;
      case AppThemeType.mocha:
        return isDark ? _mochaDark : _mochaLight;
      case AppThemeType.defaultTheme:
      default:
        return isDark ? darkTheme : lightTheme;
    }
  }

  // Default themes
  static final ThemeData lightTheme = _buildTheme(
    brightness: Brightness.light,
    scaffold: AppColors.lightScaffold,
    card: AppColors.lightCard,
    primary: AppColors.lightPrimary,
    secondary: AppColors.lightSecondary,
    tertiary: AppColors.lightTertiary,
    textPrimary: AppColors.lightTextPrimary,
    textSecondary: AppColors.lightTextSecondary,
    error: AppColors.lightError,
  );

  static final ThemeData darkTheme = _buildTheme(
    brightness: Brightness.dark,
    scaffold: AppColors.darkScaffold,
    card: AppColors.darkCard,
    primary: AppColors.darkPrimary,
    secondary: AppColors.darkSecondary,
    tertiary: AppColors.darkTertiary,
    textPrimary: AppColors.darkTextPrimary,
    textSecondary: AppColors.darkTextSecondary,
    error: AppColors.darkError,
  );

  // Ocean themes
  static final ThemeData _oceanLight = _buildTheme(
    brightness: Brightness.light,
    scaffold: AppColors.oceanLightScaffold,
    card: AppColors.oceanLightCard,
    primary: AppColors.oceanLightPrimary,
    secondary: AppColors.oceanLightSecondary,
    tertiary: AppColors.oceanLightTertiary,
    textPrimary: AppColors.lightTextPrimary,
    textSecondary: AppColors.lightTextSecondary,
    error: AppColors.lightError,
  );

  static final ThemeData _oceanDark = _buildTheme(
    brightness: Brightness.dark,
    scaffold: AppColors.oceanDarkScaffold,
    card: AppColors.oceanDarkCard,
    primary: AppColors.oceanDarkPrimary,
    secondary: AppColors.oceanDarkSecondary,
    tertiary: AppColors.oceanDarkTertiary,
    textPrimary: AppColors.darkTextPrimary,
    textSecondary: AppColors.darkTextSecondary,
    error: AppColors.darkError,
  );

  // Forest themes
  static final ThemeData _forestLight = _buildTheme(
    brightness: Brightness.light,
    scaffold: AppColors.forestLightScaffold,
    card: AppColors.forestLightCard,
    primary: AppColors.forestLightPrimary,
    secondary: AppColors.forestLightSecondary,
    tertiary: AppColors.forestLightTertiary,
    textPrimary: AppColors.lightTextPrimary,
    textSecondary: AppColors.lightTextSecondary,
    error: AppColors.lightError,
  );

  static final ThemeData _forestDark = _buildTheme(
    brightness: Brightness.dark,
    scaffold: AppColors.forestDarkScaffold,
    card: AppColors.forestDarkCard,
    primary: AppColors.forestDarkPrimary,
    secondary: AppColors.forestDarkSecondary,
    tertiary: AppColors.forestDarkTertiary,
    textPrimary: AppColors.darkTextPrimary,
    textSecondary: AppColors.darkTextSecondary,
    error: AppColors.darkError,
  );

  // Sunset themes
  static final ThemeData _sunsetLight = _buildTheme(
    brightness: Brightness.light,
    scaffold: AppColors.sunsetLightScaffold,
    card: AppColors.sunsetLightCard,
    primary: AppColors.sunsetLightPrimary,
    secondary: AppColors.sunsetLightSecondary,
    tertiary: AppColors.sunsetLightTertiary,
    textPrimary: AppColors.lightTextPrimary,
    textSecondary: AppColors.lightTextSecondary,
    error: AppColors.lightError,
  );

  static final ThemeData _sunsetDark = _buildTheme(
    brightness: Brightness.dark,
    scaffold: AppColors.sunsetDarkScaffold,
    card: AppColors.sunsetDarkCard,
    primary: AppColors.sunsetDarkPrimary,
    secondary: AppColors.sunsetDarkSecondary,
    tertiary: AppColors.sunsetDarkTertiary,
    textPrimary: AppColors.darkTextPrimary,
    textSecondary: AppColors.darkTextSecondary,
    error: AppColors.darkError,
  );

  // Lavender themes
  static final ThemeData _lavenderLight = _buildTheme(
    brightness: Brightness.light,
    scaffold: AppColors.lavenderLightScaffold,
    card: AppColors.lavenderLightCard,
    primary: AppColors.lavenderLightPrimary,
    secondary: AppColors.lavenderLightSecondary,
    tertiary: AppColors.lavenderLightTertiary,
    textPrimary: AppColors.lightTextPrimary,
    textSecondary: AppColors.lightTextSecondary,
    error: AppColors.lightError,
  );

  static final ThemeData _lavenderDark = _buildTheme(
    brightness: Brightness.dark,
    scaffold: AppColors.lavenderDarkScaffold,
    card: AppColors.lavenderDarkCard,
    primary: AppColors.lavenderDarkPrimary,
    secondary: AppColors.lavenderDarkSecondary,
    tertiary: AppColors.lavenderDarkTertiary,
    textPrimary: AppColors.darkTextPrimary,
    textSecondary: AppColors.darkTextSecondary,
    error: AppColors.darkError,
  );

  // Mocha themes
  static final ThemeData _mochaLight = _buildTheme(
    brightness: Brightness.light,
    scaffold: AppColors.mochaLightScaffold,
    card: AppColors.mochaLightCard,
    primary: AppColors.mochaLightPrimary,
    secondary: AppColors.mochaLightSecondary,
    tertiary: AppColors.mochaLightTertiary,
    textPrimary: AppColors.lightTextPrimary,
    textSecondary: AppColors.lightTextSecondary,
    error: AppColors.lightError,
  );

  static final ThemeData _mochaDark = _buildTheme(
    brightness: Brightness.dark,
    scaffold: AppColors.mochaDarkScaffold,
    card: AppColors.mochaDarkCard,
    primary: AppColors.mochaDarkPrimary,
    secondary: AppColors.mochaDarkSecondary,
    tertiary: AppColors.mochaDarkTertiary,
    textPrimary: AppColors.darkTextPrimary,
    textSecondary: AppColors.darkTextSecondary,
    error: AppColors.darkError,
  );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color scaffold,
    required Color card,
    required Color primary,
    required Color secondary,
    required Color tertiary,
    required Color textPrimary,
    required Color textSecondary,
    required Color error,
  }) {
    final isLight = brightness == Brightness.light;
    
    return ThemeData(
      brightness: brightness,
      useMaterial3: true,
      scaffoldBackgroundColor: scaffold,
      cardColor: card,
      primaryColor: primary,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: isLight ? Colors.white : Colors.black,
        secondary: secondary,
        onSecondary: Colors.white,
        tertiary: tertiary,
        onTertiary: Colors.white,
        surface: card,
        onSurface: textPrimary,
        error: error,
        onError: Colors.white,
        outline: isLight ? const Color(0xFFD8D8D8) : const Color(0xFF2C2C2C),
        shadow: isLight ? const Color(0x1A000000) : Colors.black,
        surfaceTint: Colors.transparent,
        inverseSurface: card,
        onInverseSurface: textPrimary,
        inversePrimary: primary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scaffold,
        elevation: 0,
        iconTheme: IconThemeData(color: textPrimary),
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}