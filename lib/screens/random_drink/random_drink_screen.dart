// ignore: unused_import
import 'dart:developer';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:mix_it/utils/constants/constants.dart';
import 'package:mix_it/widgets/app_bar/main_app_bar.dart';
import 'package:mix_it/widgets/side_nav.dart';
import 'package:mix_it/screens/drink_details/drink_details.dart';
import 'package:mix_it/services/network.dart';

class RandomDrinkScreen extends StatefulWidget {
  const RandomDrinkScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RandomDrinkScreen();
  }
}

class _RandomDrinkScreen extends State<RandomDrinkScreen> {
  dynamic drinkId;
  @override
  void initState() {
    super.initState();
    _getRandomDrink();
  }

  _getRandomDrink() async {
    String route = '/random.php';
    dynamic params;

    Network networkHandler = Network();
    String response = await networkHandler.postRequest(route, params);
    var json = await jsonDecode(response);
    setState(() {
      if (json['drinks'][0]['idDrink'] == null) return;
      drinkId = json['drinks'][0]['idDrink'];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (drinkId != null) {
      return DrinkDetails(
        drinkRef: drinkId!,
        refType: "id",
      );
    } else {
      return Scaffold(
        appBar: const MainAppBar(
          height: kAppBarHeight,
        ),
        endDrawer: SideNav(
          context: context,
        ),
        body: ListView(children: const [
          Column(
            children: [Text('Loading')],
          ),
        ]),
      );
    }
  }
}
