import "package:flutter/material.dart";
import 'package:shimmer/shimmer.dart';

import 'package:mix_it/utils/colors/custom_colors.dart';

// Shimmer's for drink lists
Widget kShimmerListCards = Shimmer.fromColors(
  baseColor: CustomColors.kPrimary.shade500,
  highlightColor: CustomColors.kPrimary.shade400,
  period: const Duration(seconds: 2),
  enabled: true,
  child: ListView.builder(
    itemCount: 20,
    itemBuilder: (context, index) {
      return Container(
          height: 134,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 28,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: CustomColors.kPrimary.shade800),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 75,
                      height: 24,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: CustomColors.kPrimary.shade800),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ));
    },
  ),
);
