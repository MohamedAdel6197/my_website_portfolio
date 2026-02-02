import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static const localeKey = "appLocale";
  static Future<void> setLocale(String locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(localeKey, locale);
  }

  static Future<String> getLocale() async =>
      (await SharedPreferences.getInstance()).getString(localeKey) ?? "en";
  static const themeKey = "appTheme";

  static Future<void> setTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(themeKey, theme);
  }

  static Future<String> getTheme() async =>
      (await SharedPreferences.getInstance()).getString(themeKey) ?? "dark";
}
