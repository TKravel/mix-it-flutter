// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:mix_it/screens/home_page/home_page.dart';
import 'package:mix_it/screens/latest_drinks/newly_added_screen.dart';
import 'package:mix_it/screens/popular/popular_screen.dart';
import 'package:mix_it/screens/random_drink/random_drink_screen.dart';
import 'package:mix_it/utils/constants/constants.dart';

class SideNav extends Drawer {
  const SideNav({super.key, required this.context});

  final BuildContext context;

  _handleNavSelection(String selection) {
    Widget newScreen = const HomePage();
    switch (selection) {
      case 'popular':
        newScreen = const PopularScreen();
        break;
      case 'new':
        newScreen = const NewlyAddedScreen();
        break;
      case 'random':
        newScreen = const RandomDrinkScreen();
    }

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => newScreen), (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          TextButton(
              onPressed: () => {_handleNavSelection('popular')},
              child: Text(
                "Popular",
                style: kDrawerButtonTextStyles,
              )),
          TextButton(
              onPressed: () => {_handleNavSelection('new')},
              child: Text(
                "New",
                style: kDrawerButtonTextStyles,
              )),
          TextButton(
              onPressed: () => {_handleNavSelection('random')},
              child: Text(
                "Random",
                style: kDrawerButtonTextStyles,
              )),
        ],
      ),
    );
  }
}
