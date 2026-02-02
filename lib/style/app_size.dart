class Insets {
  static double get maxWidth => 1280.0;
  static double get appBarHeight => 56;
  static double get largePadding => 16.0;
  static double get medPadding => 12;
  static double get smallPadding => 8.0;
  static double get xSmallPadding => 4.0;
}

abstract class AppInsets {
  double get padding;
  double get appBarHeight;
  double get sectionPadding;
}

class SmallInsets implements AppInsets {
  @override
  double get padding => 16.0;

  @override
  double get appBarHeight => 56;

  @override
  double get sectionPadding => 40.0;
}

class LargeInsets implements AppInsets {
  @override
  double get padding => 60.0;

  @override
  double get appBarHeight => 64;

  @override
  double get sectionPadding => 100.0;
}
