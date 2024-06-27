// ignore: unused_import
import 'dart:developer';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:mix_it/screens/drink_details/drink_details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mix_it/services/network.dart';
import 'package:mix_it/models/drink_model.dart';
import 'package:mix_it/utils/colors/custom_colors.dart';

class Carousel extends StatefulWidget {
  const Carousel(
      {super.key,
      required this.drinkId,
      required this.drinkCategory,
      required this.ingredients});

  final String drinkId;
  final String drinkCategory;
  final Map<String, String> ingredients;

  @override
  State<StatefulWidget> createState() {
    return _CarouselState();
  }
}

class _CarouselState extends State<Carousel> {
  var isLoading = true;
  List<Drink> similarDrinks = [];
  int ingredientsCount = 0;
  int currentIdx = 1;
  bool noSimilarDrinks = false;
  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    ingredientsCount = widget.ingredients.keys.length;
    _getSimilarDrinks(_getIngredientString());
  }

  _getSimilarDrinks(ingredient) async {
    if (currentIdx > ingredientsCount) {
      noSimilarDrinks = true;
      isLoading = false;
    }
    const String similiarRoute = "/filter.php";
    Map<String, String> params2 = {'i': ingredient};
    Network networkHandler = Network();
    String similarResponse =
        await networkHandler.apiPostRequest(similiarRoute, params2);
    var similarJson = jsonDecode(similarResponse);
    if (similarJson['drinks'].length == 0) {
      currentIdx++;
      _getSimilarDrinks(_getIngredientString());
    }
    similarDrinks = [];
    for (var i = 0; i < similarJson['drinks'].length; i++) {
      if (similarJson['drinks'][i]["idDrink"] != widget.drinkId) {
        similarDrinks.add(Drink.fromJson(similarJson['drinks'][i]));
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  _getIngredientString() {
    return widget.ingredients.keys.elementAt(currentIdx).replaceAll(" ", "_");
  }

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
    return Stack(
      children: [
        if (isLoading == true)
          const Text("loading...")
        else if (noSimilarDrinks)
          const Text("No similar drinks...")
        else
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
