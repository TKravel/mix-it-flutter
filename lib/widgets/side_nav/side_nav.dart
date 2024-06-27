// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mix_it/screens/drink_details/drink_details.dart';
import 'package:mix_it/screens/drink_lists/drink_lists.dart';

import 'package:mix_it/screens/home_page/home_page.dart';
import 'package:mix_it/utils/colors/custom_colors.dart';
import 'package:mix_it/utils/constants/constants.dart';
import 'package:mix_it/widgets/side_nav/category_expansion.dart';

class SideNav extends Drawer {
  const SideNav({super.key, required this.context});

  final BuildContext context;

  _handleNavSelection(
      String selection, String? categoryName, String? categoryRoute) {
    Widget newScreen = const HomePage();
    switch (selection) {
      case 'popular':
        newScreen = const DrinkListPage(
            pageHeader: "Popular", apiRoute: '/popular.php', apiParams: null);
        break;
      case 'new':
        newScreen = const DrinkListPage(
            pageHeader: "Newly added",
            apiRoute: '/latest.php',
            apiParams: null);
        break;
      case 'random':
        newScreen = const DrinkDetails(
          drinkRef: "random",
          refType: "random",
        );
        break;
      case 'category':
        final routeArr = categoryRoute!.split("?");
        final paramArr = routeArr[1].split("=");
        newScreen = DrinkListPage(
            pageHeader: categoryName!,
            apiRoute: routeArr[0],
            apiParams: {paramArr[0]: paramArr[1]});
        break;
    }

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => newScreen), (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "images/cropped-bottles.jpg",
                        width: 100,
                      ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () =>
                        {_handleNavSelection('popular', null, null)},
                    child: Text(
                      "Popular",
                      style: kDrawerButtonTextStyles,
                    )),
                TextButton(
                    onPressed: () => {_handleNavSelection('new', null, null)},
                    child: Text(
                      "New",
                      style: kDrawerButtonTextStyles,
                    )),
                TextButton(
                  onPressed: () => {_handleNavSelection('random', null, null)},
                  child: Text(
                    "Random",
                    style: kDrawerButtonTextStyles,
                  ),
                ),
                CategoryExpansion(
                  handleNavSelection: _handleNavSelection,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            // decoration: BoxDecoration(color: CustomColors.kPrimary[900]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: CustomColors.kPrimary[200]),
                  "- Made with ",
                ),
                Icon(
                  color: CustomColors.kPrimary[200],
                  size: 20,
                  Icons.local_bar,
                ),
                Text(
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: CustomColors.kPrimary[200]),
                    " by TKDev -")
              ],
            ),
          )
        ],
      ),
    );
  }
}
