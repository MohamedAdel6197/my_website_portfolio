import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_shared_pref.dart';

part 'app_theme_controller.g.dart';

@riverpod
class AppThemeController extends _$AppThemeController {
  @override
  Future<ThemeMode> build() async {
    final theme = await AppSharedPref.getTheme();
    return theme == 'light' ? ThemeMode.light : ThemeMode.dark;
  }

  Future<void> toggleTheme() async {
    final currentTheme = state.value ?? ThemeMode.dark;
    final newTheme = currentTheme == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

    state = const AsyncLoading();
    await Future.delayed(const Duration(milliseconds: 500));
    await AppSharedPref.setTheme(
      newTheme == ThemeMode.light ? 'light' : 'dark',
    );
    state = AsyncData(newTheme);
  }
}
