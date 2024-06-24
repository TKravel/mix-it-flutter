// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mix_it/utils/constants/constants.dart';
import 'package:mix_it/widgets/app_bar/main_app_bar.dart';

import 'package:mix_it/widgets/side_nav/side_nav.dart';
import 'package:mix_it/widgets/drink_list/selection_grid.dart';

class DrinkListPage extends StatelessWidget {
  const DrinkListPage(
      {super.key,
      required this.pageHeader,
      required this.apiRoute,
      required this.apiParams});
  final String pageHeader;
  final String apiRoute;
  final Map<String, String>? apiParams;
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
                style: TextStyle(
                  color: kTextOnPrimary,
                  fontSize: 20,
                ),
                pageHeader),
          ),
          Expanded(
            child: SelectionGrid(
              pageHeader,
              route: apiRoute,
              params: apiParams,
            ),
          ),
        ],
      ),
    );
  }
}
