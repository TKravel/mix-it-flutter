import 'package:flutter/material.dart';

import 'package:mix_it/models/drink_model.dart';
import 'package:mix_it/utils/colors/custom_colors.dart';

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
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
                      style: TextStyle(
                        color: CustomColors.kPrimary.shade50,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      drinkData.strCategory!,
                      style: TextStyle(
                        color: CustomColors.kPrimary.shade200,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
