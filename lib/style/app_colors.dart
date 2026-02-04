import 'package:flutter/material.dart';

class AppColors {
  // Primary Palette
  static const Color primaryColor = Color(
    0xFF6C63FF,
  ); // More vibrant purple/indigo accent
  static const Color secondaryColor = Color(
    0xFF00BFA5,
  ); // Teal/Cyan accent for contrast
  static const Color tertiaryColor = Color(
    0xFFFF6584,
  ); // Pink/Salmon accent depending on use

  // Backgrounds
  static const Color darkBackgroundColor = Color(
    0xFF1E1E2C,
  ); // Rich dark blue-grey
  static const Color lightBackgroundColor = Color(0xFFF4F6F8); // Soft off-white

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF3F3D56)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF00BFA5), Color(0xFF00d4ff)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Color darkSurfaceColor = Color(0xFF2D2D44);
  static const Color lightSurfaceColor = Color(0xFFFFFFFF);

  static const Color flutterColor = Color(0xFF0175C2);

  static const grey = MaterialColor(100, {
    100: Color(0xffFBFBFB),
    200: Color(0xffE2E2E2),
    300: Color(0xffC9C9C9),
    400: Color(0xffB0B0B0),
    500: Color(0xff979797),
    600: Color(0xff7E7E7E),
    700: Color(0xff646464),
    800: Color(0xff333333),
    850: Color(0xff131313),
    900: Color(0xff110d12),
  });
}
