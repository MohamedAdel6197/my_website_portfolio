import 'package:flutter/material.dart';

import '../router/app_routes.dart';

class AppbarMenuItems {
  static List<MenuItem> getMenuItems(BuildContext context) {
    return [
      MenuItem("Home", AppRoutes.home),
      MenuItem("contact Me", AppRoutes.contactMe),
      MenuItem("Courses", AppRoutes.courses),
      MenuItem("Projects", AppRoutes.projects),
    ];
  }
}

class MenuItem {
  String title;
  String path;
  MenuItem(this.title, this.path);
}
