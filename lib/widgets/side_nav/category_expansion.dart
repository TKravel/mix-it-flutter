// ignore: unused_import
import "dart:developer";

import "package:flutter/material.dart";
import "package:mix_it/utils/colors/custom_colors.dart";

import "package:mix_it/utils/constants/constants.dart";

Map<String, String> categories = {
  "/filter.php?c=Ordinary_Drink": "Ordinary Drink",
  "/filter.php?c=Cocktail": "Cocktail",
  "/filter.php?c=Shake": "Shake",
  "/filter.php?c=Shot": "Shot",
  "/filter.php?c=Coffee_/_Tea": "Coffee / Tea",
  "/filter.php?c=Beer": "Beer",
  "/filter.php?c=Soft_Drink": "Soft Drink",
  "/filter.php?c=Punch_/_Party_Drink": "Punch / Party Drink",
  "/filter.php?c=Homemade_Liqueur": "Homemade Liqueur",
  "/filter.php?c=Other_/_Unknown": "Other / Unknown"
};

class CategoryExpansion extends StatefulWidget {
  const CategoryExpansion({super.key, required this.handleNavSelection});
  final Function handleNavSelection;

  @override
  State<CategoryExpansion> createState() {
    return _CategoryExpansion();
  }
}

class _CategoryExpansion extends State<CategoryExpansion> {
  bool expandedState = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExpansionPanelList(
        elevation: 0,
        expandedHeaderPadding: const EdgeInsets.all(0),
        dividerColor: kSivNavBackground,
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            expandedState = isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            canTapOnHeader: true,
            backgroundColor: kSivNavBackground,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                focusColor: const Color.fromARGB(255, 34, 36, 43),
                leading: const SizedBox(
                  width: 44,
                ),
                title: Text(
                    style: kDrawerButtonTextStyles,
                    textAlign: TextAlign.center,
                    "Categories"),
              );
            },
            body: Column(
                children: categories.entries.map((entry) {
              return TextButton(
                onPressed: () => {
                  widget.handleNavSelection("category", entry.value, entry.key)
                },
                child: Text(
                  entry.value,
                  style: kDrawerButtonTextStyles,
                ),
              );
            }).toList()),
            isExpanded: expandedState,
          )
        ],
      ),
    );
  }
}
