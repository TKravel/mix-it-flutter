// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:mix_it/screens/home_page/componets/search_bar.dart';
import 'package:mix_it/utils/constants/constants.dart';
import 'package:mix_it/widgets/app_bar/main_app_bar.dart';
import 'package:mix_it/widgets/drink_list/selection_grid.dart';
import 'package:mix_it/widgets/side_nav/side_nav.dart';

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
        body: Column(children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: AutoSearchBar(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
              'Top Searches',
            ),
          ),
          const Expanded(
            child: SelectionGrid(
              null,
              route: '/popular.php',
              params: null,
            ),
          ),
        ]),
      ),
    );
  }
}
