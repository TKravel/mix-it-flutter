import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:mix_it/utils/colors/custom_colors.dart';

// APP BAR
const double kAppBarHeight = 60.0;

Color kScaffold = const Color(0xff0b132b);
Color kScaffoldContainer = const Color(0xff1c2541);
Color kPageBottomBorder = const Color(0xFF161E35);
Color kTextOnPrimary = CustomColors.kPrimary.shade50;
Color kSivNavBackground = const Color(0xff1a1b21);

// BUTTON CONSTANTS

TextStyle kDrawerButtonTextStyles = TextStyle(
  color: CustomColors.kAccent.shade100,
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

// SHIMMERS

Widget kPlaceholder = Shimmer.fromColors(
  baseColor: CustomColors.kPrimary.shade400,
  highlightColor: CustomColors.kPrimary.shade300,
  period: Duration(seconds: 2),
  enabled: true,
  child: ClipRRect(
    borderRadius: BorderRadius.circular(300),
    child: const Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.white),
          child: SizedBox(
            height: 100,
            width: 100,
          ),
        )
      ],
    ),
  ),
);
