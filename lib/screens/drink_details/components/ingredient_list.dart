// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({super.key, required this.ingredients});

  final Map<String, String> ingredients;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Ingredients',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            for (var entry in ingredients.entries)
              if (entry.key != "")
                Text(
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.left,
                  textWidthBasis: TextWidthBasis.parent,
                  "${entry.key} (${entry.value.trim()})",
                ),
          ],
        )
      ],
    );
  }
}
