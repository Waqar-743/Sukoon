import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const Color primary = Color(0xFFDA7756);
  static const Color primaryDark = Color(0xFF994528);
  static const Color primaryLight = Color(0xFFFBF0EB);
  static const Color secondary = Color(0xFF6B8F71);
  static const Color secondaryLight = Color(0xFFEEF4EF);
  static const Color tertiary = Color(0xFFC4891A);
  static const Color tertiaryLight = Color(0xFFFDF4E3);
  static const Color neutral = Color(0xFF7A6860);
  static const Color background = Color(0xFFFAF6F2);
  static const Color surface = Colors.white;
  static const Color textPrimary = Color(0xFF2A1F1A);
  static const Color error = Color(0xFFC0444A);
  static const Color errorLight = Color(0xFFF7D0D1);
  static const double maxContentWidth = 520;

  static ThemeData light() {
    const scheme = ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: Colors.white,
      primaryContainer: primaryLight,
      onPrimaryContainer: primaryDark,
      secondary: secondary,
      onSecondary: Colors.white,
      secondaryContainer: secondaryLight,
      onSecondaryContainer: Color(0xFF294033),
      tertiary: tertiary,
      onTertiary: Colors.white,
      tertiaryContainer: tertiaryLight,
      onTertiaryContainer: Color(0xFF5C400B),
      error: error,
      onError: Colors.white,
      errorContainer: errorLight,
      onErrorContainer: Color(0xFF5E1D20),
      surface: surface,
      onSurface: textPrimary,
      onSurfaceVariant: neutral,
      outline: Color(0xFFE4D7CC),
      outlineVariant: Color(0xFFF1E7E0),
      shadow: Colors.black,
      scrim: Colors.black54,
      inverseSurface: textPrimary,
      onInverseSurface: Colors.white,
      inversePrimary: primaryDark,
      surfaceTint: primary,
    );

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: background,
    );

    return base.copyWith(
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: textPrimary,
        contentTextStyle: TextStyle(color: Colors.white),
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        margin: EdgeInsets.zero,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xFFF1E7E0),
        thickness: 1,
      ),
      chipTheme: base.chipTheme.copyWith(
        backgroundColor: surface,
        selectedColor: primaryLight,
        labelStyle: const TextStyle(
          color: neutral,
          fontWeight: FontWeight.w600,
        ),
        secondaryLabelStyle: const TextStyle(
          color: primaryDark,
          fontWeight: FontWeight.w700,
        ),
        side: const BorderSide(color: Color(0xFFE9DDD4)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        hintStyle: const TextStyle(color: Color(0xFFA48F85)),
        labelStyle: const TextStyle(color: neutral),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xFFE9DDD4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xFFE9DDD4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: primary, width: 1.6),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(56),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: textPrimary,
          minimumSize: const Size.fromHeight(56),
          side: const BorderSide(color: Color(0xFFE2D5CB)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        extendedTextStyle: TextStyle(fontWeight: FontWeight.w700),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primary,
        linearTrackColor: primaryLight,
      ),
      textTheme: base.textTheme.copyWith(
        displaySmall: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: textPrimary,
          height: 1.05,
        ),
        headlineMedium: const TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w800,
          color: textPrimary,
          height: 1.1,
        ),
        headlineSmall: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: textPrimary,
          height: 1.2,
        ),
        titleLarge: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: textPrimary,
        ),
        titleMedium: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: textPrimary,
        ),
        bodyLarge: const TextStyle(
          fontSize: 16,
          height: 1.5,
          color: textPrimary,
        ),
        bodyMedium: const TextStyle(fontSize: 14, height: 1.5, color: neutral),
        bodySmall: const TextStyle(fontSize: 12, height: 1.4, color: neutral),
      ),
    );
  }
}
