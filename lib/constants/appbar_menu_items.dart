import 'package:flutter/material.dart';

import '../locale_keys.dart';
import '../router/app_routes.dart';

class AppbarMenuItems {
  static List<MenuItem> getMenuItems(BuildContext context) {
    return [
      MenuItem(LocaleKeys.aboutMe, AppRoutes.about, 'about'),
      MenuItem(
        LocaleKeys.professionalExperience,
        AppRoutes.experience,
        'experience',
      ),
      MenuItem(LocaleKeys.projects, AppRoutes.projects, 'projects'),
      MenuItem(LocaleKeys.courses, AppRoutes.courses, 'courses'),
    ];
  }

  static List<MenuItem> getDrawerItems(BuildContext context) {
    return [
      MenuItem(LocaleKeys.home, AppRoutes.home, 'hero'),
      MenuItem(LocaleKeys.aboutMe, AppRoutes.about, 'about'),
      MenuItem(
        LocaleKeys.professionalExperience,
        AppRoutes.experience,
        'experience',
      ),
      MenuItem(LocaleKeys.projects, AppRoutes.projects, 'projects'),
      MenuItem(LocaleKeys.courses, AppRoutes.courses, 'courses'),
      MenuItem(
        LocaleKeys.skillsTechnicalBackground,
        AppRoutes.skills,
        'skills',
      ),
      MenuItem(LocaleKeys.contactMe, AppRoutes.contactMe, 'contact'),
    ];
  }
}

class MenuItem {
  String title;
  String path;
  String sectionId;

  MenuItem(this.title, this.path, this.sectionId);
}
