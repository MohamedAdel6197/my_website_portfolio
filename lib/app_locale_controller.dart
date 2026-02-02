import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'shared/app_shared_pref.dart';

part 'app_locale_controller.g.dart';

@riverpod
class AppLocaleController extends _$AppLocaleController {
  @override
  FutureOr<String> build() {
    return AppSharedPref.getLocale();
  }

  void setLocale(String locale) async {
    await AppSharedPref.setLocale(locale);
    update((state) => locale);
  }
}
