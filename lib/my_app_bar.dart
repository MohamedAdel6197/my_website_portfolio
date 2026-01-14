import 'package:flutter/material.dart';

import 'extensions.dart';
import 'l10n/app_localizations.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarLogo(),
        AppBarTitle(),
        AppBarMenu(),
        AppBarThemeToggle(),
        AppBarLanguageToggle(),
      ],
    );
  }
}

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    return Text(
      AppLocalizations.of(context)!.mohamed_adel,
      style: context.appTextStyles.titleLgBlod,
    );
  }
}

class AppBarMenu extends StatelessWidget {
  const AppBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        Text("Home"),
        Text("About Me"),
        Text("Projects"),
        Text("Courses"),
      ],
    );
  }
}

class AppBarLanguageToggle extends StatelessWidget {
  const AppBarLanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(child: Text("English")),
          PopupMenuItem(child: Text("Arabic")),
        ];
      },
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
