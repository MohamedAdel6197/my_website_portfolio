import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_size.dart';

class AppTheme {
  final String fontFamily;

  AppTheme({required this.fontFamily});

  // Reusable button style logic
  WidgetStateProperty<Color?> get _primaryButtonBackgroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.pressed)) {
          return AppColors.primaryColor.withOpacity(0.8);
        }
        return AppColors.primaryColor;
      });

  WidgetStateProperty<BorderSide?> get _outlineButtonBorderSide =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.pressed)) {
          return BorderSide(color: AppColors.primaryColor.withOpacity(0.8));
        }
        return const BorderSide(color: AppColors.primaryColor);
      });

  // Dark Theme Definition
  ThemeData get dark => _getThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      surface: AppColors.darkSurfaceColor,
      onSurface: AppColors.grey[100]!,
      onSurfaceVariant: AppColors.grey[300],
      outline: AppColors.grey[700],
      tertiary: AppColors.tertiaryColor,
    ),
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    appBarBackgroundColor: AppColors.darkSurfaceColor.withOpacity(0.8),
    elevatedButtonTextStyle: _elevatedButtonTextStyle,
    outlinedButtonTextStyle: _outlinedButtonTextStyle,
    cardColor: AppColors.darkSurfaceColor,
  );

  // Light Theme Definition
  ThemeData get light => _getThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      surface: AppColors.lightSurfaceColor,
      onSurface: AppColors.grey[900]!,
      onSurfaceVariant: AppColors.grey[700],
      outline: AppColors.grey[300],
      tertiary: AppColors.tertiaryColor,
    ),
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    appBarBackgroundColor: AppColors.lightSurfaceColor.withOpacity(0.8),
    elevatedButtonTextStyle: _elevatedButtonTextStyle,
    outlinedButtonTextStyle: _outlinedButtonTextStyle,
    cardColor: AppColors.lightSurfaceColor,
  );

  // Shared Text Styles for Buttons
  WidgetStatePropertyAll<TextStyle> get _elevatedButtonTextStyle =>
      WidgetStatePropertyAll<TextStyle>(
        TextStyle(
          color: Colors.white,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      );

  WidgetStatePropertyAll<TextStyle> get _outlinedButtonTextStyle =>
      WidgetStatePropertyAll<TextStyle>(
        TextStyle(
          color: AppColors.primaryColor,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      );

  // Theme Data Construction Helper
  ThemeData _getThemeData({
    required ColorScheme colorScheme,
    required Color scaffoldBackgroundColor,
    required Color appBarBackgroundColor,
    required WidgetStateProperty<TextStyle> elevatedButtonTextStyle,
    required WidgetStateProperty<TextStyle> outlinedButtonTextStyle,
    required Color cardColor,
  }) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      cardColor: cardColor,

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackgroundColor,
        scrolledUnderElevation: 0,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        titleTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontFamily: fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const WidgetStatePropertyAll(
            Size.fromHeight(48),
          ), // Slightly taller buttons
          backgroundColor: _primaryButtonBackgroundColor,
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Insets.largePadding, vertical: 0),
          ),
          textStyle: elevatedButtonTextStyle,
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          elevation: const WidgetStatePropertyAll(4), // Add subtle shadow
          shadowColor: WidgetStatePropertyAll(
            AppColors.primaryColor.withOpacity(0.3),
          ),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const WidgetStatePropertyAll(Size.fromHeight(48)),
          side: _outlineButtonBorderSide,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Insets.largePadding, vertical: 0),
          ),
          textStyle: outlinedButtonTextStyle,
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),

      // Icon Theme
      iconTheme: IconThemeData(color: colorScheme.onSurface, size: 24),
    );
  }
}
