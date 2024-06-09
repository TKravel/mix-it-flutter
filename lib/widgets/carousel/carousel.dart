import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:mix_it/services/network.dart';
import 'package:mix_it/models/drink_model.dart';
import 'package:mix_it/utils/colors/custom_colors.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key, required this.ingredients});

  final Map<String, String> ingredients;

  @override
  State<StatefulWidget> createState() {
    return _CarouselState();
  }
}

class _CarouselState extends State<Carousel> {
  var isLoading = true;
  List<Drink> similarDrinks = [];
  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _getSimilarDrinks();
  }

  _getSimilarDrinks() async {
    const String similiarRoute = "/filter.php";
    String ingred1 = widget.ingredients.keys.elementAt(0).replaceAll(" ", "_");
    String ingred2 = widget.ingredients.keys.elementAt(1).replaceAll(" ", "_");
    Map<String, String> params2 = {'i': '$ingred1,$ingred2'};
    Network networkHandler = Network();
    String similarResponse =
        await networkHandler.postRequest(similiarRoute, params2);
    var similarJson = jsonDecode(similarResponse);
    similarDrinks = [];
    for (var i = 0; i < similarJson['drinks'].length; i++) {
      similarDrinks.add(Drink.fromJson(similarJson['drinks'][i]));
    }
    print(similarDrinks.length);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isLoading == true)
          const Text("loading...")
        else
          CarouselSlider.builder(
            itemCount: similarDrinks.length,
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              autoPlay: false,
              height: 400,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 1,
            ),
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Image.network(
                      similarDrinks[itemIndex].strDrinkThumb!,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Text(
                    similarDrinks[itemIndex].strDrink!,
                    style: TextStyle(
                      color: CustomColors.kPrimary.shade50,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
        Positioned(
          left: 0,
          top: 185,
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
          top: 185,
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
        )
      ],
    );
  }
}
