import 'package:flutter/material.dart';

import '../locale_keys.dart';
import '../router/app_routes.dart';

class AppbarMenuItems {
  static List<MenuItem> getMenuItems(BuildContext context) {
    return [
      MenuItem(LocaleKeys.home, AppRoutes.home),
      MenuItem(LocaleKeys.contactMe, AppRoutes.contactMe),
      MenuItem(LocaleKeys.courses, AppRoutes.courses),
      MenuItem(LocaleKeys.projects, AppRoutes.projects),
    ];
  }
}

class MenuItem {
  String title;
  String path;
  MenuItem(this.title, this.path);
}
