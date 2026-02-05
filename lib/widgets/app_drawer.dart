import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../constants/appbar_menu_items.dart';
import '../extensions.dart';
import '../locale_keys.dart';
import '../providers/current_section_provider.dart';
import '../style/app_colors.dart';
import '../style/app_size.dart';

class AppDrawer extends ConsumerWidget {
  final Function(String)? onMenuItemTap;

  const AppDrawer({super.key, this.onMenuItemTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItems = AppbarMenuItems.getDrawerItems(context);
    final currentSection = ref.watch(currentSectionProvider);

    return Drawer(
      width: context.width * 0.75,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            const Gap(10),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: Insets.medPadding,
                  vertical: Insets.smallPadding,
                ),
                itemCount: menuItems.length,
                separatorBuilder: (context, index) => const Gap(8),
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  final isSelected = currentSection == item.sectionId;

                  return _DrawerTile(
                    title: item.title,
                    icon: _getIconForSection(item.sectionId),
                    isSelected: isSelected,
                    onTap: () {
                      Navigator.pop(context);
                      if (onMenuItemTap != null) {
                        onMenuItemTap!(item.sectionId);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Insets.largePadding),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colorScheme.primary.withValues(alpha: 0.15),
            context.colorScheme.primary.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 95,
            height: 95,
            decoration: BoxDecoration(shape: BoxShape.circle),
            padding: const EdgeInsets.all(4), // Border width
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.white, width: 2),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/mhmd.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Gap(5),
          Text(
            LocaleKeys.mohamedAdel,
            style: context.appTextStyles.titleLgBlod.copyWith(fontSize: 22),
          ),
          Text(
            "Flutter Developer",
            style: context.appTextStyles.bodyMdMedium.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForSection(String sectionId) {
    switch (sectionId) {
      case 'hero':
        return Icons.home_rounded;
      case 'about':
        return Icons.person_rounded;
      case 'experience':
        return Icons.business_center_rounded;
      case 'projects':
        return Icons.code_rounded;
      case 'courses':
        return Icons.school_rounded;
      case 'skills':
        return Icons.psychology_rounded;
      case 'contact':
        return Icons.alternate_email_rounded;
      default:
        return Icons.circle;
    }
  }
}

class _DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _DrawerTile({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? context.colorScheme.primary
        : context.colorScheme.onSurface;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withValues(alpha: 0.1)
              : AppColors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? context.colorScheme.primary.withValues(alpha: 0.2)
                : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 24, color: color),
            const Gap(16),
            Expanded(
              child: Text(
                title,
                style: context.appTextStyles.bodyLgMedium.copyWith(
                  color: color,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            ),
            if (isSelected)
              Icon(Icons.arrow_forward_ios_rounded, size: 14, color: color),
          ],
        ),
      ),
    );
  }
}
