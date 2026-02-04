import 'package:flutter/material.dart';

import '../locale_keys.dart';
import '../router/app_routes.dart';

class AppbarMenuItems {
  static List<MenuItem> getMenuItems(BuildContext context) {
    return [
      MenuItem(LocaleKeys.aboutMe, AppRoutes.about),
      MenuItem(LocaleKeys.professionalExperience, AppRoutes.experience),
      MenuItem(LocaleKeys.projects, AppRoutes.projects),
      MenuItem(LocaleKeys.courses, AppRoutes.courses),
      // MenuItem(LocaleKeys.skills, AppRoutes.skills),
    ];
  }
}

class MenuItem {
  String title;
  String path;
  MenuItem(this.title, this.path);
}
