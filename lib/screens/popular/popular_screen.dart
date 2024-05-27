import 'package:flutter/material.dart';

import 'package:mix_it/widgets/side_nav.dart';
import 'package:mix_it/widgets/drink_list/selection_grid.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  final String route = '/popular.php';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mix-It!"),
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
