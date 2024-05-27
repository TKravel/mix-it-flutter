import 'package:flutter/material.dart';

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
        TableCell(child: Text(entry.key)),
        const TableCell(
            child: Text(
          "--",
          style: TextStyle(color: Colors.transparent),
        )),
        TableCell(child: Text(entry.value)),
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
