// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mix_it/screens/drink_lists/drink_lists.dart';

import 'package:mix_it/screens/home_page/home_page.dart';
import 'package:mix_it/screens/random_drink/random_drink_screen.dart';
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
        newScreen = const RandomDrinkScreen();
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
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
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
              onPressed: () => {_handleNavSelection('popular', null, null)},
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
    );
  }
}
