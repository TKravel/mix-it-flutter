import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:mix_it/models/drink_model.dart';
import 'package:mix_it/screens/drink_details/components/ingredient_list.dart';
import 'package:mix_it/utils/colors/custom_colors.dart';

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
    print(_screenWidth);
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
        IngredientList(ingredients: widget.drinkData.ingredients!)
      ],
    );
  }
}
