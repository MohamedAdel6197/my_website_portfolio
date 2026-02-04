import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localingo/localingo.dart';

import 'home_page.dart';
import 'providers/app_locale_provider.dart';
import 'providers/app_theme_provider.dart' hide AppTheme;
import 'style/app_colors.dart';
import 'style/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(appLocaleProvider);
    final themeMode = ref.watch(appThemeProvider);
    Localingo.setNavigatorKey(_navigatorKey);
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: "Mohamed Adel Portfolio",
      debugShowCheckedModeBanner: false,
      locale: Locale(locale.value ?? 'en'),
      localizationsDelegates: [
        AppLocalizations.delegate,
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
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
            ),
        ],
      ),
    );
  }
}
