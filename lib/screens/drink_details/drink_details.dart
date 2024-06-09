// ignore: unused_import
import 'dart:developer';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mix_it/utils/constants/constants.dart';
import 'package:mix_it/widgets/app_bar/main_app_bar.dart';
import 'package:mix_it/widgets/carousel/carousel.dart';

import 'package:mix_it/widgets/side_nav.dart';
import 'package:mix_it/models/drink_model.dart';
import 'package:mix_it/screens/drink_details/components/drink_info.dart';
import 'package:mix_it/services/network.dart';

class DrinkDetails extends StatefulWidget {
  const DrinkDetails({super.key, required this.drinkId});

  final String drinkId;

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
    _getSelectedDrinkData();
  }

  _getSelectedDrinkData() async {
    const String route = "/lookup.php";
    Map<String, String> params = {'i': widget.drinkId};
    Network networkHandler = Network();
    String response = await networkHandler.postRequest(route, params);
    var drinkJson = jsonDecode(response);
    drinkData = Drink.fromJson(drinkJson['drinks'][0]);
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
                Carousel(
                  ingredients: drinkData.ingredients!,
                ),
              ],
            )
          // SimilarDrinks(),
        ],
      ),
    );
  }
}
