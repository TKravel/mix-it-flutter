import 'package:flutter/material.dart';
import 'package:mix_it/screens/home_page/componets/landing_hero.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("title"),
      ),
      body: const LandingHero(),
    );
  }
}
