import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:my_website_portfolio/extensions.dart';

import '../../providers/app_locale_provider.dart';
import '../seo_text.dart';

class AppBarLanguageToggle extends ConsumerWidget {
  const AppBarLanguageToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(appLocaleProvider);
    return GestureDetector(
      onTap: () {
        ref.read(appLocaleProvider.notifier).changeLanguage();
      },
      child: Row(
        children: [
          Icon(
            locale.value == 'en'
                ? FontAwesomeIcons.globe
                : FontAwesomeIcons.language,
            color: context.colorScheme.onSurface,
            size: 15,
          ),
          Gap(8),
          Text(
            locale.value == 'en' ? 'English' : 'عربي',
            style: context.appTextStyles.bodyMdMedium,
          ),
          Gap(6),
        ],
      ),
    );

    /* PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 0,
            child: PopUpLanguageItem(lang: 'English', icon: "images/usa.png"),
          ),
          PopupMenuItem(
            value: 1,
            child: PopUpLanguageItem(lang: 'عربي', icon: "images/egy.png"),
          ),
        ];
      },
      onSelected: (value) {
        ref.read(appLocaleControllerProvider.notifier).changeLanguage();
      },
      initialValue: locale.value == 'en' ? 0 : 1,
      child: Row(
        children: [
          Icon(Icons.language, color: context.colorScheme.onSurface),
          Gap(6),
          SEOText(locale.value == 'en' ? 'en' : 'ar'),
          Gap(6),
        ],
      ),
    );*/
  }
}

class PopUpLanguageItem extends StatelessWidget {
  const PopUpLanguageItem({super.key, required this.lang, required this.icon});

  final String lang;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon, fit: BoxFit.contain, width: 30, height: 18),
        Gap(8),
        SEOText(lang),
      ],
    );
  }
}
