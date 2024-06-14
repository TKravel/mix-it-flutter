// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mix_it/screens/home_page/componets/search_bar.dart';

import 'package:mix_it/utils/constants/constants.dart';

class LandingHero extends StatelessWidget {
  const LandingHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const AutoSearchBar(),
          Text(
            'Mix-It!',
            style: TextStyle(
              color: kTextOnPrimary,
              fontSize: 30,
            ),
          ),
          Text(
            'Instructions, ingredents, and suggestions. Everything you need to mix up your night.',
            style: TextStyle(
              color: kTextOnPrimary,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
