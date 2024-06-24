// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:mix_it/models/drink_model.dart';
import 'package:mix_it/screens/drink_details/components/ingredient_list.dart';
import 'package:mix_it/utils/colors/custom_colors.dart';
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
    final _screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 40),
        ClipRRect(
          borderRadius: BorderRadius.circular(300),
          child: Image.network(
            widget.drinkData.strDrinkThumb!,
            width: _screenWidth * .75,
            height: _screenWidth * .75,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                widget.drinkData.strDrink!,
                style: TextStyle(
                  color: CustomColors.kPrimary.shade50,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Type: ${widget.drinkData.strAlcoholic!}',
                style: TextStyle(
                  color: CustomColors.kPrimary.shade50,
                  fontSize: 20,
                ),
              ),
              Text(
                'Glass: ${widget.drinkData.strGlass!}',
                style: TextStyle(
                  color: CustomColors.kPrimary.shade50,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        IngredientList(ingredients: widget.drinkData.ingredients!),
        Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Text(
                "Instructions",
                style: TextStyle(
                  color: kTextOnPrimary,
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.drinkData.strInstructions!,
                style: TextStyle(
                  color: kTextOnPrimary,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
