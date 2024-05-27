import 'package:flutter/material.dart';

import 'package:mix_it/models/drink_model.dart';

class DrinkCardSm extends StatelessWidget {
  const DrinkCardSm(
      {super.key, required this.drinkData, required this.handleTap});

  final Drink drinkData;
  final Function handleTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {handleTap(drinkData.idDrink!)},
      child: Card(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Image.network(
                drinkData.strDrinkThumb!,
                width: 100,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    drinkData.strDrink!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(drinkData.strCategory!)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
