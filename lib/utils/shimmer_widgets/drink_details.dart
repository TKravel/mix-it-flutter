import "package:flutter/material.dart";
import 'package:shimmer/shimmer.dart';

import 'package:mix_it/utils/colors/custom_colors.dart';

// Shimmer's for drink lists
Widget kHeroImage = Shimmer.fromColors(
    baseColor: CustomColors.kPrimary.shade500,
    highlightColor: CustomColors.kPrimary.shade400,
    period: const Duration(seconds: 2),
    enabled: true,
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(300),
          child: const FractionallySizedBox(
            widthFactor: .7,
            heightFactor: 0.3,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
        ),
      ],
    ));
