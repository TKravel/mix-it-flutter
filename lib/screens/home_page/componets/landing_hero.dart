import 'package:flutter/material.dart';

class LandingHero extends StatelessWidget {
  const LandingHero({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text('Mix-It!'),
          Text(
              'Instructions, ingredents, and suggestions. Everything you need to mix up your night.'),
        ],
      ),
    );
  }
}
