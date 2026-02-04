import 'package:flutter/painting.dart';

abstract class AppTextStyles {
  TextStyle get titleSmBold;
  TextStyle get titleLgBlod;
  TextStyle get titleMdMedium;
  TextStyle get bodyLgMedium;
  TextStyle get bodyLgBlod;
  TextStyle get bodyMdMedium;
}

class SmallTextStyles extends AppTextStyles {
  @override
  TextStyle get titleSmBold =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyLgBlod =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyLgMedium =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodyMdMedium =>
      TextStyle(fontSize: 12, fontWeight: FontWeight.w500);

  @override
  TextStyle get titleLgBlod =>
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  @override
  TextStyle get titleMdMedium =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
}

class LargeTextStyles extends AppTextStyles {
  @override
  TextStyle get bodyLgBlod =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  TextStyle get bodyLgMedium =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodyMdMedium =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  @override
  TextStyle get titleLgBlod =>
      TextStyle(fontSize: 40, fontWeight: FontWeight.bold);

  @override
  TextStyle get titleMdMedium =>
      TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

  @override
  TextStyle get titleSmBold =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
}
