import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_locale_controller.dart';
import 'home_page.dart';
import 'l10n/app_localizations.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(locale.value ?? 'en'),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ar')],
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme(
        fontFamily: (locale.value ?? 'en') == 'en' ? "Dosis" : "Beiruti",
      ).dark,
      theme: AppTheme(
        fontFamily: (locale.value ?? 'en') == 'en' ? "Dosis" : "Beiruti",
      ).light,
      home: const HomePage(),
    );
  }
}
