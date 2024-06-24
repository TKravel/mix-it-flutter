// ignore: unused_import
import 'dart:developer';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:mix_it/screens/drink_details/drink_details.dart';
import 'package:mix_it/services/network.dart';
import 'package:mix_it/models/drink_model.dart';
import 'package:mix_it/utils/constants/constants.dart';
import 'package:mix_it/widgets/drink_list/drink_card_sm.dart';

class SelectionGrid extends StatefulWidget {
  const SelectionGrid(this.categoryName,
      {super.key, required this.route, required this.params});

  final String? categoryName;
  final String route;
  final Map<String, String>? params;

  @override
  State<SelectionGrid> createState() {
    return _SelectionGrid();
  }
}

class _SelectionGrid extends State<SelectionGrid> {
  List<Drink> drinks = [];
  @override
  void initState() {
    super.initState();
    _getDrinks();
  }

  _getDrinks() async {
    Network networkHandler = Network();
    String json =
        await networkHandler.apiPostRequest(widget.route, widget.params);
    var drinkData = await jsonDecode(json);
    // drinkData.map((drink) => drinks.add(Drink.fromJson(drink))); //
    List<Drink> drinkArr = [];
    for (var drink in drinkData['drinks']) {
      drinkArr.add(Drink.fromJson(drink));
    }
    setState(() {
      drinks = drinkArr;
    });
  }

  handleSelection(String slectedId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DrinkDetails(
          drinkRef: slectedId,
          refType: "id",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (drinks.isEmpty) {
      return kShimmerCards;
    } else {
      return ListView.builder(
        itemCount: drinks.length,
        itemBuilder: (context, int) {
          return DrinkCardSm(widget.categoryName,
              drinkData: drinks[int], handleTap: handleSelection);
        },
      );
    }
  }
}
