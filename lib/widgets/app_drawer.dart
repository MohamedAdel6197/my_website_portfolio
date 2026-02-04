import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/appbar_menu_items.dart';
import '../extensions.dart';
import '../locale_keys.dart';
import '../router/app_routes.dart';
import '../style/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = AppbarMenuItems.getMenuItems(context);

    return Drawer(
      backgroundColor: context.colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.1),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.flutter_dash,
                    size: 48,
                    color: AppColors.primaryColor,
                  ),
                  const Gap(10),
                  Text(
                    LocaleKeys.mohamedAdel,
                    style: context.appTextStyles.titleMdMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return ListTile(
                  leading: Icon(_getIconForPath(item.path)),
                  title: Text(
                    item.title,
                    style: context.appTextStyles.bodyLgMedium,
                  ),
                  onTap: () {
                    // Navigate or scroll to section
                    Navigator.pop(context);
                    // For now, these might need to be linked to scroll controllers
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForPath(String path) {
    switch (path) {
      case AppRoutes.home:
        return Icons.home_outlined;
      case AppRoutes.contactMe:
        return Icons.contact_mail_outlined;
      case AppRoutes.courses:
        return Icons.school_outlined;
      case AppRoutes.projects:
        return Icons.work_outline;
      default:
        return Icons.link;
    }
  }
}
