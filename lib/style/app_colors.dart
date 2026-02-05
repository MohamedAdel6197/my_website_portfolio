import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color secondaryColor = Color(0xFF00BFA5);
  static const Color tertiaryColor = Color(0xFFFF6584);
  static const Color darkBackgroundColor = Color(0xFF1E1E2C);
  static const Color lightBackgroundColor = Color(0xFFF4F6F8);

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

  static const Color white = Colors.white;
  static const Color white70 = Colors.white70;
  static const Color white38 = Colors.white38;
  static const Color black = Colors.black;
  static const Color amber = Colors.amber;
  static const Color blue = Colors.blue;
  static const Color transparent = Colors.transparent;

  static const Color orbIndigo = Color(0xFF6366F1);
  static const Color orbPurple = Color(0xFF8B5CF6);
  static const Color orbPink = Color(0xFFEC4899);
  static const Color orbBlue = Color(0xFF3B82F6);
  static const Color orbCyan = Color(0xFF06B6D4);

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
