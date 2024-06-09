// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mix_it/utils/colors/custom_colors.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({super.key, required this.ingredients});

  final Map<String, String> ingredients;

  @override
  Widget build(BuildContext context) {
    // create row items
    List<TableRow> ingredientRows = List.empty(growable: true);
    for (var entry in ingredients.entries) {
      // ingredientRows.add(Text('${entry.key} - ${entry.value}'));
      ingredientRows.add(TableRow(children: [
        TableCell(
            child: Text(
          entry.key,
          style: TextStyle(
            color: CustomColors.kPrimary.shade50,
            fontSize: 20,
          ),
        )),
        TableCell(
            child: Text(
          "-",
          style: TextStyle(
            color: CustomColors.kPrimary.shade50,
            fontSize: 20,
          ),
        )),
        TableCell(
          child: Text(
            entry.value,
            style: TextStyle(
              color: CustomColors.kPrimary.shade50,
              fontSize: 20,
            ),
          ),
        ),
      ]));
    }

    return Center(
        child: Column(
      children: [
        const Text('Ingredients'),
        Table(
          columnWidths: Map.from({
            0: const IntrinsicColumnWidth(),
            1: const FixedColumnWidth(10),
            2: const IntrinsicColumnWidth()
          }),
          // inject rows created above
          children: [...ingredientRows],
        ),
      ],
    ));
  }
}
