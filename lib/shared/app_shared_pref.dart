import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static const localeKey = "appLocale";
  static Future<void> setLocale(String locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(localeKey, locale);
  }

  static Future<String> getLocale() async =>
      (await SharedPreferences.getInstance()).getString(localeKey) ?? "en";
}
