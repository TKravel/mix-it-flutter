// ignore: unused_import
import 'dart:developer';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:mix_it/screens/drink_details/drink_details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mix_it/services/network.dart';
import 'package:mix_it/models/drink_model.dart';
import 'package:mix_it/utils/colors/custom_colors.dart';
import 'package:mix_it/utils/constants/constants.dart';

/// Based off of selected drink will show similar drinks in a carousel
class Carousel extends StatefulWidget {
  const Carousel(
      {super.key,
      required this.drinkId,
      required this.drinkCategory,
      required this.ingredients});

  /// Current ID for selected drink
  final String drinkId;

  /// Category of selected drink
  final String drinkCategory;

  /// Ingredient measurements keyed by ingredient name
  final Map<String, String> ingredients;

  @override
  State<StatefulWidget> createState() {
    return _CarouselState();
  }
}

class _CarouselState extends State<Carousel> {
  /// Whether widget is loading
  bool isLoading = true;

  /// Whether similar drinks were found
  bool noSimilarDrinks = false;

  /// Total ingredients for selected drink
  int ingredientsCount = 0;

  /// Similar drinks
  List<Drink> similarDrinks = [];

  /// Carousel controller
  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    ingredientsCount = widget.ingredients.keys.length;
    getSimilarDrinks();
  }

  /// Get similar drinks based on ingredients.
  /// Searches for similar drinks one ingredient at at time until ingredient list is exhausted.
  /// Updates [isLoading] and [noSimilarDrinks] state variables based on results.
  getSimilarDrinks() async {
    int currentIdx = 0;
    Network networkHandler = Network();
    dynamic similarJson;
    // Call API for similar drinks
    do {
      // Break if list is exhausted - set json variable to null
      if (currentIdx == ingredientsCount) {
        similarJson = null;
        break;
      }
      // Call API with ingredient based on current iteration
      Map<String, String> params = {'i': _getIngredientString(currentIdx)};
      String similarResponse =
          await networkHandler.apiPostRequest("/filter.php", params);
      similarJson = jsonDecode(similarResponse);
      currentIdx++;
      // Continue loop while results are less than 2 (excludes current drink)
    } while (similarJson['drinks'].length < 2);

    // Json exists with at least 2 drinks
    // Populate drink list with drinks from Json - removing selected drink
    if (similarJson != null) {
      for (var i = 0; i < similarJson['drinks'].length; i++) {
        if (similarJson['drinks'][i]["idDrink"] != widget.drinkId) {
          similarDrinks.add(Drink.fromJson(similarJson['drinks'][i]));
        }
      }
    }

    // Update state for rebuild
    setState(() {
      isLoading = false;
      noSimilarDrinks = similarDrinks.isEmpty ? true : false;
    });
  }

  /// Sanitize ingredient name for API call
  ///
  /// Returns ingredient by index
  _getIngredientString(int currentIdx) {
    return widget.ingredients.keys.elementAt(currentIdx).replaceAll(" ", "_");
  }

  /// Selection of similar drink functionality
  _handleTap(String drinkId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DrinkDetails(
          drinkRef: drinkId,
          refType: "id",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Return loading message
    if (isLoading == true) {
      return const CarouselMessageContainer(message: "Loading...");
      // Return no results message
    } else if (noSimilarDrinks) {
      return const CarouselMessageContainer(message: "No similar drinks");
      // Return Carousel of similar drinks
    } else {
      return Stack(
        children: [
          CarouselSlider.builder(
            itemCount: similarDrinks.length,
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              autoPlay: false,
              height: 300,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 1,
            ),
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  _handleTap(similarDrinks[itemIndex].idDrink!);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        similarDrinks[itemIndex].strDrinkThumb!,
                        width: 200,
                        height: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      similarDrinks[itemIndex].strDrink!,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 115,
            child: Ink(
              child: IconButton(
                color: CustomColors.kAccent.shade100,
                iconSize: 40,
                onPressed: () => buttonCarouselController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear),
                icon: const Icon(
                  Icons.chevron_left_rounded,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 115,
            child: IconButton(
              color: CustomColors.kAccent.shade100,
              iconSize: 40,
              onPressed: () => buttonCarouselController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear),
              icon: const Icon(
                Icons.chevron_right_rounded,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Text(
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
              "Similar Drinks (${similarDrinks.length})",
            ),
          ),
        ],
      );
    }
  }
}

/// Reusable message container
class CarouselMessageContainer extends StatelessWidget {
  const CarouselMessageContainer({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(color: kScaffoldContainer),
      child: Text(
        style: Theme.of(context).textTheme.titleLarge,
        message,
      ),
    );
  }
}
