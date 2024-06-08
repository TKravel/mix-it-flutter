import 'package:flutter/material.dart';

import 'package:mix_it/screens/home_page/componets/landing_hero.dart';
import 'package:mix_it/widgets/drink_list/selection_grid.dart';
import 'package:mix_it/widgets/side_nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String route = '/popular.php';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () => {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (_) => false)
          },
          child: const Text("Mix-It!"),
        ),
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
    );
  }
}
