import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/app_shared_pref.dart';

class AppLocaleController extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() {
    return AppSharedPref.getLocale();
  }

  void setLocale(String locale) async {
    await AppSharedPref.setLocale(locale);
    update((state) => locale);
  }
}
