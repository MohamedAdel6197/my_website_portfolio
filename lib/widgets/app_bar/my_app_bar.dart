import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app_text_styles.dart';
import '../../constants/appbar_menu_items.dart';
import '../../extensions.dart';
import '../../locale_keys.dart';
import '../../providers/app_theme_provider.dart';
import '../../providers/current_section_provider.dart';
import '../../style/app_size.dart';
import 'drawer_icon.dart';
import 'language_switch.dart';

class MyAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final Function(String)? onMenuItemTap;

  const MyAppBar({super.key, this.onMenuItemTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSection = ref.watch(currentSectionProvider);
    final isHeroActive = currentSection == 'hero';

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      alignment: Alignment.center,
      height: context.insets.appBarHeight,
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      color: context.theme.appBarTheme.backgroundColor,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Insets.maxWidth),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBarLogo(),
            AppBarTitle(
              isSelected: isHeroActive,
              onTap: () {
                if (onMenuItemTap != null) {
                  onMenuItemTap!('hero');
                }
              },
            ),
            if (context.isDesktop(context))
              AppBarLargeMenu(onMenuItemTap: onMenuItemTap),
            AppBarLanguageToggle(),
            AppBarThemeToggle(),
            if (!context.isDesktop(context)) DrawerIcon(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    final window = WidgetsBinding.instance.platformDispatcher.views.first;
    final width = window.physicalSize.width / window.devicePixelRatio;

    if (width < 600) {
      return const Size.fromHeight(60);
    } else {
      return const Size.fromHeight(70);
    }
  }
}

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      FontAwesomeIcons.flutter,
      size: context.isDesktop(context) ? 40 : 30,
      color: Colors.blue,
    );
  }
}

class AppBarTitle extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  const AppBarTitle({super.key, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        LocaleKeys.mohamedAdel,
        style: context.appTextStyles.titleLgBlod.copyWith(
          color: isSelected ? context.colorScheme.primary : null,
        ),
      ),
    );
  }
}

class AppBarLargeMenu extends ConsumerWidget {
  final Function(String)? onMenuItemTap;

  const AppBarLargeMenu({super.key, this.onMenuItemTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSection = ref.watch(currentSectionProvider);

    return Row(
      spacing: context.isDesktop(context) ? 15 : 5,
      children: AppbarMenuItems.getMenuItems(context)
          .map(
            (e) => AppBarLargeMenuItem(
              title: e.title,
              isSelected: currentSection == e.sectionId,
              onTap: () {
                if (onMenuItemTap != null) {
                  onMenuItemTap!(e.sectionId);
                }
              },
            ),
          )
          .toList(),
    );
  }
}

class AppBarLargeMenuItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const AppBarLargeMenuItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.medPadding,
          vertical: Insets.xSmallPadding,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected
                  ? context.colorScheme.primary
                  : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          style: isSelected
              ? context.appTextStyles.bodyLgMedium.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                )
              : SmallTextStyles().bodyLgMedium,
        ),
      ),
    );
  }
}

class AppBarThemeToggle extends ConsumerWidget {
  const AppBarThemeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeProvider);
    final isLight = themeMode.value == ThemeMode.light;
    return Switch(
      value: !isLight,
      onChanged: (value) {
        ref.read(appThemeProvider.notifier).toggleTheme();
      },
      activeThumbColor: context.colorScheme.primary,
      padding: EdgeInsets.zero,
      thumbIcon: WidgetStateProperty.resolveWith<Icon?>((
        Set<WidgetState> states,
      ) {
        if (states.contains(WidgetState.selected)) {
          return const Icon(Icons.dark_mode, size: 16);
        }
        return const Icon(
          Icons.light_mode,
          size: 16,
          color: Colors.orange,
        ); // Light mode icon
      }),
    );
  }
}
