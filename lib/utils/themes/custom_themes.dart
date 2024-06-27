import 'package:flutter/material.dart';

import 'package:mix_it/utils/colors/custom_colors.dart';
import 'package:mix_it/utils/constants/constants.dart';

class CustomThemes {
  static ThemeData customDarkTheme = ThemeData(
    useMaterial3: true,
  ).copyWith(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: CustomColors.kPrimary,
      ),
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: CustomColors.kPrimary.shade900,
        foregroundColor: CustomColors.kAccent.shade100,
      ),
      scaffoldBackgroundColor: kScaffold,
      cardTheme:
          const CardTheme().copyWith(color: CustomColors.kPrimary.shade400),
      textTheme: const TextTheme()
          .copyWith(displaySmall: TextStyle(color: kTextOnPrimary)));
}
