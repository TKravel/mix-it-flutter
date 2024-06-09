import 'package:flutter/material.dart';

class CustomColors {
  static const MaterialColor kPrimary =
      MaterialColor(_kmainPrimaryValue, <int, Color>{
    50: Color(0xFFE2E3E6),
    100: Color(0xFFB6B8BF),
    200: Color(0xFF858995),
    300: Color(0xFF545A6B),
    400: Color(0xFF30364B),
    500: Color(_kmainPrimaryValue),
    600: Color(0xFF0A1126),
    700: Color(0xFF080E20),
    800: Color(0xFF060B1A),
    900: Color(0xFF030610),
  });
  static const int _kmainPrimaryValue = 0xFF0B132B;

  static const MaterialColor kAccent =
      MaterialColor(_kmainAccentValue, <int, Color>{
    100: Color(0xFF5270FF),
    200: Color(_kmainAccentValue),
    400: Color(0xFF0028EB),
    700: Color(0xFF0023D2),
  });
  static const int _kmainAccentValue = 0xFF1F45FF;
}
