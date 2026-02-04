import 'package:flutter/material.dart';

import 'app_text_styles.dart';
import 'style/app_size.dart';

enum DeviceType { mobile, tablet, desktop }

extension StyleContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get width => mediaQuery.size.width;
  double get height => mediaQuery.size.height;

  DeviceType get deviceType {
    if (width < 600) {
      return DeviceType.mobile;
    } else if (width < 950) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  bool isMobile(BuildContext context) =>
      context.deviceType == DeviceType.mobile;
  bool isTablet(BuildContext context) =>
      context.deviceType == DeviceType.tablet;
  bool isDesktop(BuildContext context) =>
      context.deviceType == DeviceType.desktop;

  AppTextStyles get appTextStyles {
    switch (deviceType) {
      case DeviceType.mobile:
      case DeviceType.tablet:
        return SmallTextStyles();
      case DeviceType.desktop:
        return LargeTextStyles();
    }
  }

  AppInsets get insets {
    switch (deviceType) {
      case DeviceType.mobile:
        return SmallInsets();
      case DeviceType.tablet:
      case DeviceType.desktop:
        return LargeInsets();
    }
  }

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  // AppLocalizations get texts =>
  //     AppLocalizations.of(this) ?? lookupAppLocalizations(Locale("en"));
}
