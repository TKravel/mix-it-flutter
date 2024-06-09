// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:mix_it/screens/home_page/componets/landing_hero.dart';
import 'package:mix_it/utils/constants/constants.dart';
import 'package:mix_it/widgets/app_bar/main_app_bar.dart';
import 'package:mix_it/widgets/drink_list/selection_grid.dart';

import 'package:mix_it/widgets/side_nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String route = '/popular.php';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MainAppBar(
          height: kAppBarHeight,
        ),
        endDrawer: SideNav(
          context: context,
        ),
        body: ListView(children: [
          Column(
            children: [
              const LandingHero(),
              SelectionGrid(null, route: route),
            ],
          ),
        ]),
      ),
    );
  }
}
