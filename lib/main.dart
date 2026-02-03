import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page.dart';
import 'shared/app_locale_controller.dart';
import 'shared/app_theme_controller.dart';
import 'style/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(appLocaleControllerProvider);
    final themeMode = ref.watch(appThemeControllerProvider);

    return MaterialApp(
      title: "Mohamed Adel Portfolio",
      debugShowCheckedModeBanner: false,
      locale: Locale(locale.value ?? 'en'),
      localizationsDelegates: [
        // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ar')],
      themeMode: themeMode.value ?? ThemeMode.dark,
      darkTheme: AppTheme(
        fontFamily: (locale.value ?? 'en') == 'en' ? "Dosis" : "Beiruti",
      ).dark,
      theme: AppTheme(
        fontFamily: (locale.value ?? 'en') == 'en' ? "Dosis" : "Beiruti",
      ).light,
      home: Stack(
        children: [
          const HomePage(),
          if (locale.isLoading || themeMode.isLoading)
            Container(
              color: Colors.black54,
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
