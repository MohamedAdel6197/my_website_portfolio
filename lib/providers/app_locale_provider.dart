import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../shared/app_shared_pref.dart';

part 'app_locale_provider.g.dart';

@riverpod
class AppLocale extends _$AppLocale {
  @override
  FutureOr<String> build() {
    return AppSharedPref.getLocale();
  }

  Future<void> changeLanguage() async {
    final currentLocale = state.value ?? 'en';
    final newLocale = currentLocale == 'en' ? 'ar' : 'en';

    await AppSharedPref.setLocale(newLocale);
    state = AsyncData(newLocale);
  }
}
