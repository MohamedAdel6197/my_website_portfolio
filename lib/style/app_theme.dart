import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_size.dart';

class AppTheme {
  final String fontFamily;

  AppTheme({required this.fontFamily});
  ThemeData get dark => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.grey[900]),
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.darkBackgroundColor,
      onSurface: AppColors.grey[100]!,
    ),
  );

  final _primaryButtonStates = WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.hovered) ||
        states.contains(WidgetState.pressed)) {
      return const Color(0xff561895).withValues(alpha: 0.7);
    }
    return AppColors.primaryColor;
  });
  final _outlineButtonStates = WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.hovered) ||
        states.contains(WidgetState.pressed)) {
      return BorderSide(color: const Color(0xff561895).withValues(alpha: 0.7));
    }
    return BorderSide(color: AppColors.primaryColor);
  });

  WidgetStatePropertyAll<TextStyle> get _darkElevatedButtonTextStyle =>
      WidgetStatePropertyAll<TextStyle>(
        TextStyle(
          color: AppColors.grey[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );
  WidgetStatePropertyAll<TextStyle> get _lightElevatedButtonTextStyle =>
      WidgetStatePropertyAll<TextStyle>(
        TextStyle(
          color: AppColors.grey[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );
  WidgetStatePropertyAll<TextStyle> get _darkOutlinedButtonTextStyle =>
      WidgetStatePropertyAll<TextStyle>(
        TextStyle(
          color: AppColors.grey[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );
  WidgetStatePropertyAll<TextStyle> get _lightOutlinedButtonTextStyle =>
      WidgetStatePropertyAll<TextStyle>(
        TextStyle(
          color: AppColors.grey[800],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );

  ThemeData get darkTheme => _getThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      surface: AppColors.grey[850]!,
      outline: AppColors.grey[800],
      outlineVariant: AppColors.grey[700],
      onSurface: AppColors.grey[300]!,
      onSurfaceVariant: AppColors.grey[400],
      tertiary: AppColors.grey[900],
    ),
    elevatedButtonTextStyle: _darkElevatedButtonTextStyle,
    outlinedButtonTextStyle: _darkOutlinedButtonTextStyle,
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.grey[900]!.withValues(alpha: 0.3),
    ),
  );

  ThemeData get light => _getThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      surface: AppColors.grey[200]!,
      outline: AppColors.grey[300],
      outlineVariant: AppColors.grey[400],
      onSurface: AppColors.grey[700]!,
      onSurfaceVariant: AppColors.grey[600],
      tertiary: AppColors.grey[900],
    ),
    elevatedButtonTextStyle: _lightElevatedButtonTextStyle,
    outlinedButtonTextStyle: _lightOutlinedButtonTextStyle,
    scaffoldBackgroundColor: AppColors.grey[100]!,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.grey[100]!.withValues(alpha: 0.1),
    ),
  );

  ThemeData _getThemeData({
    required ColorScheme colorScheme,
    required WidgetStateProperty<TextStyle> elevatedButtonTextStyle,
    required WidgetStateProperty<TextStyle> outlinedButtonTextStyle,
    required Color scaffoldBackgroundColor,
    required AppBarTheme appBarTheme,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: appBarTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
          backgroundColor: _primaryButtonStates,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Insets.largePadding, vertical: 10),
          ),
          textStyle: elevatedButtonTextStyle,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
          side: _outlineButtonStates,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Insets.largePadding, vertical: 10),
          ),
          textStyle: outlinedButtonTextStyle,
        ),
      ),
    );
  }
}
