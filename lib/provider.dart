import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/app_locale_controller.dart';

final appLocaleProvider = AsyncNotifierProvider<AppLocaleController, String>(
  AppLocaleController.new,
);

final appThemeModeProvider = Provider<ThemeMode>((ref) {
  return ThemeMode.dark;
});
