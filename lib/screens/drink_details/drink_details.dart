// ignore: unused_import
import 'dart:developer';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mix_it/utils/constants/constants.dart';
import 'package:mix_it/widgets/app_bar/main_app_bar.dart';
import 'package:mix_it/widgets/carousel/carousel.dart';

import 'package:mix_it/widgets/side_nav/side_nav.dart';
import 'package:mix_it/models/drink_model.dart';
import 'package:mix_it/screens/drink_details/components/drink_info.dart';
import 'package:mix_it/services/network.dart';

class DrinkDetails extends StatefulWidget {
  const DrinkDetails(
      {super.key, required this.drinkRef, required this.refType});

  final String drinkRef;
  final String refType;

  @override
  State<StatefulWidget> createState() {
    return _DrinkDetails();
  }
}

class _DrinkDetails extends State<DrinkDetails> {
  late final Drink drinkData;
  late final List<Drink> similarDrinks;
  String init = 'starting';

  @override
  void initState() {
    super.initState();
    widget.drinkRef == "random" ? _getRandomDrink() : _getSelectedDrinkData();
  }

  _getSelectedDrinkData() async {
    String route = widget.refType == 'id' ? "/lookup.php" : "/search.php";
    Map<String, String> params = widget.refType == 'id'
        ? {'i': widget.drinkRef}
        : {'s': widget.drinkRef};
    Network networkHandler = Network();
    String response = await networkHandler.apiPostRequest(route, params);
    var drinkJson = jsonDecode(response);
    drinkData = Drink.fromJson(drinkJson['drinks'][0]);
    setState(() {
      init = 'done';
    });
  }

  _getRandomDrink() async {
    String route = '/random.php';

    Network networkHandler = Network();
    String response = await networkHandler.apiPostRequest(route, null);
    var json = await jsonDecode(response);
    if (json['drinks'][0]['idDrink'] == null) return;
    drinkData = Drink.fromJson(json['drinks'][0]);
    setState(() {
      init = 'done';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        height: kAppBarHeight,
      ),
      endDrawer: SideNav(
        context: context,
      ),
      body: ListView(
        children: [
          if (init == 'starting')
            const Text('Loading')
          else
            Column(
              children: [
                DrinkInfo(drinkData),
                Container(
                  decoration: BoxDecoration(color: kScaffoldContainer),
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: Carousel(
                    drinkId: drinkData.idDrink!,
                    drinkCategory: drinkData.strCategory!,
                    ingredients: drinkData.ingredients!,
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
