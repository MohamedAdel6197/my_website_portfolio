// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../app_text_styles.dart';
import '../../constants/appbar_menu_items.dart';
import '../../extensions.dart';
import '../../style/app_size.dart';
import 'drawer_icon.dart';
import 'language_switch.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      alignment: Alignment.center,
      height: context.insets.appBarHeight,
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      // color: Theme.of(context).appBarTheme.backgroundColor,
      color: context.theme.appBarTheme.backgroundColor,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Insets.maxWidth),
        child: Row(
          children: [
            AppBarLogo(),
            SizedBox(width: 30),
            AppBarTitle(),
            Spacer(),
            if (context.isDesktop(context)) AppBarLargeMenu(),
            Spacer(),
            AppBarLanguageToggle(),
            AppBarThemeToggle(),
            if (!context.isDesktop(context)) DrawerIcon(),
          ],
        ),
      ),
    );
  }
}

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.flutter_dash_outlined, size: 40);
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    return Text("mohamed adel", style: context.appTextStyles.titleLgBlod);
  }
}

class AppBarLargeMenu extends StatelessWidget {
  const AppBarLargeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: AppbarMenuItems.getMenuItems(context)
          .map(
            (e) => AppBarLargeMenuItem(
              title: e.title,
              isSelected: true,
              onTap: () {},
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
        child: Text(
          title,
          style:
              // isSelected
              // ? context.appTextStyles.titleLgBlod
              SmallTextStyles().bodyLgMedium,
        ),
      ),
    );
  }
}

class AppBarThemeToggle extends StatelessWidget {
  const AppBarThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(value: false, onChanged: (value) {});
  }
}
