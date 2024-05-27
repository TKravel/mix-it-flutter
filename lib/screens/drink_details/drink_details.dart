import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';

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
      appBar: AppBar(
        title: const Text("Mix-It!"),
      ),
      endDrawer: SideNav(
        context: context,
      ),
      body: ListView(children: [
        Column(
          children: [
            if (init == 'starting')
              const Text('Loading')
            else
              DrinkInfo(drinkData),
            // SimilarDrinks(),
          ],
        ),
      ]),
    );
  }
}
