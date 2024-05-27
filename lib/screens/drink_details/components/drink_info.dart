import 'package:flutter/material.dart';

import 'package:mix_it/models/drink_model.dart';
import 'package:mix_it/screens/drink_details/components/ingredient_list.dart';

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
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(300),
          child: Image.network(widget.drinkData.strDrinkThumb!),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                widget.drinkData.strDrink!,
                style: const TextStyle(),
                textAlign: TextAlign.center,
              ),
              Text('Type: ${widget.drinkData.strAlcoholic!}'),
              Text('Glass: ${widget.drinkData.strGlass!}'),
            ],
          ),
        ),
        IngredientList(ingredients: widget.drinkData.ingredients!)
      ],
    );
  }
}
