// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mix_it/widgets/app_bar/main_app_bar.dart';

import 'package:mix_it/widgets/side_nav.dart';
import 'package:mix_it/widgets/drink_list/selection_grid.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  final String route = '/popular.php';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        height: 60,
      ),
      endDrawer: SideNav(
        context: context,
      ),
      body: ListView(children: [
        Column(
          children: [
            const Text("Popular Drinks"),
            SelectionGrid(null, route: route),
          ],
        ),
      ]),
    );
  }
}
