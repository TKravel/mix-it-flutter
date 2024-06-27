// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:mix_it/models/drink_model.dart';
import 'package:mix_it/screens/drink_details/components/ingredient_list.dart';
import 'package:mix_it/utils/constants/constants.dart';

class DrinkInfo extends StatefulWidget {
  const DrinkInfo(this.drinkData, {super.key});

  final Drink drinkData;

  @override
  State<DrinkInfo> createState() {
    return _DrinkInfo();
  }
}

class _DrinkInfo extends State<DrinkInfo> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(color: kScaffoldContainer),
          padding: const EdgeInsets.fromLTRB(32, 60, 32, 32),
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Image.network(
                  widget.drinkData.strDrinkThumb!,
                  width: screenWidth * .7,
                  height: screenWidth * .7,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.drinkData.strDrink!,
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Type: ${widget.drinkData.strAlcoholic!}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Glass: ${widget.drinkData.strGlass!}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(color: kScaffoldContainer),
          padding: const EdgeInsets.all(32),
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: IngredientList(ingredients: widget.drinkData.ingredients!),
        ),
        Container(
          decoration: BoxDecoration(color: kScaffoldContainer),
          padding: const EdgeInsets.all(32),
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                "Instructions",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.drinkData.strInstructions!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
