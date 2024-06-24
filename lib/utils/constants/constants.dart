import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:mix_it/utils/colors/custom_colors.dart';

// APP BAR
const double kAppBarHeight = 60.0;

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

Widget kShimmerCards = Shimmer.fromColors(
  baseColor: CustomColors.kPrimary.shade500,
  highlightColor: CustomColors.kPrimary.shade400,
  period: Duration(seconds: 2),
  enabled: true,
  child: Column(children: [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: const Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 20,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: CustomColors.kPrimary.shade800),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 75,
                  height: 16,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: CustomColors.kPrimary.shade800),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: const Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 20,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: CustomColors.kPrimary.shade800),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 75,
                  height: 16,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: CustomColors.kPrimary.shade800),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: const Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 20,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: CustomColors.kPrimary.shade800),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 75,
                  height: 16,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: CustomColors.kPrimary.shade800),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: const Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 20,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: CustomColors.kPrimary.shade800),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 75,
                  height: 16,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: CustomColors.kPrimary.shade800),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: const Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 20,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: CustomColors.kPrimary.shade800),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 75,
                  height: 16,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: CustomColors.kPrimary.shade800),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: const Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 20,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: CustomColors.kPrimary.shade800),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 75,
                  height: 16,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: CustomColors.kPrimary.shade800),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
  ]),
);
