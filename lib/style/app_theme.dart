import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
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
}
