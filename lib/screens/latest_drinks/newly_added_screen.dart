// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:mix_it/utils/constants/constants.dart';
import 'package:mix_it/widgets/app_bar/main_app_bar.dart';
import 'package:mix_it/widgets/side_nav.dart';
import 'package:mix_it/widgets/drink_list/selection_grid.dart';

class NewlyAddedScreen extends StatelessWidget {
  const NewlyAddedScreen({super.key});
  final String route = '/latest.php';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        height: kAppBarHeight,
      ),
      endDrawer: SideNav(
        context: context,
      ),
      body: ListView(children: [
        Column(
          children: [
            const Text("Recently added"),
            SelectionGrid(null, route: route),
          ],
        ),
      ]),
    );
  }
}
