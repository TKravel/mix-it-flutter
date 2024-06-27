// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mix_it/utils/constants/constants.dart';

import 'package:mix_it/models/drink_model.dart';
import 'package:mix_it/utils/colors/custom_colors.dart';

class DrinkCardSm extends StatelessWidget {
  const DrinkCardSm(this.categoryName,
      {super.key, required this.drinkData, required this.handleTap});

  final String? categoryName;
  final Drink drinkData;
  final Function handleTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {handleTap(drinkData.idDrink!)},
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: SizedBox(
          height: 134,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    drinkData.strDrinkThumb!,
                    width: 100,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: kPlaceholder,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                        drinkData.strDrink!,
                      ),
                      Text(
                        drinkData.strCategory == null
                            ? categoryName!
                            : drinkData.strCategory!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: CustomColors.kPrimary.shade200),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
