// ignore: unused_import
import 'dart:developer';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:mix_it/screens/drink_details/drink_details.dart';
import 'package:mix_it/services/network.dart';

class AutoSearchBar extends StatefulWidget {
  const AutoSearchBar({super.key});

  @override
  State<AutoSearchBar> createState() {
    return _AutoSearchBar();
  }
}

class _AutoSearchBar extends State<AutoSearchBar> {
  late Iterable<String> _lastOptions = <String>[];
  String? _searchQuery;
  double _searchBarWidth = 100;

  _getSuggestions(userInput) async {
    Network network = Network();
    Uri endPoint =
        Uri.https("www.tkdevdesign.com", "/mix-it/drinks/autocomplete");
    Map<String, dynamic> pkg = {"userInput": userInput};
    var response = await network.postRequest(endPoint, pkg);
    List<String> autoList =
        (jsonDecode(response.body) as List<dynamic>).cast<String>();
    return autoList;
  }

  _handleSelection(drinkName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DrinkDetails(
          drinkRef: drinkName,
          refType: "name",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) async {
        // save current query
        _searchQuery = textEditingValue.text;

        // if text is empty clear last options and return
        if (textEditingValue.text.isEmpty) {
          _lastOptions = const Iterable<String>.empty();
          return _lastOptions;
        }

        // create options from api call
        final Iterable<String> options = await _getSuggestions(_searchQuery);

        // catch no results msg
        if (options.isEmpty && textEditingValue.text.isNotEmpty) {
          return ["No results"];
        }

        // if user input has updated return pervious results - allow call in progress to update options
        if (_searchQuery != textEditingValue.text) {
          return _lastOptions;
        }

        // update last options - return options
        _lastOptions = options;
        return options;
      },
      onSelected: (option) => {
        print("slected"),
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController autocompleteController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {
        // Implement the text field UI
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            _searchBarWidth = (constraints.maxWidth);
            return SearchBar(
              hintText: "Search by name...",
              controller: autocompleteController,
              focusNode: fieldFocusNode,
              onChanged: (val) {
                print(val);
              },
              onSubmitted: (text) {
                // Handle the submission of the selected suggestion
                // Implement the logic for the selection action
              },
            );
          },
        );
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            borderRadius: BorderRadius.circular(
              6,
            ),
            child: Container(
              width: _searchBarWidth,
              decoration: BoxDecoration(
                color: Colors.grey[900],
              ),
              child: ListView(
                shrinkWrap: true,
                children: options.map((String option) {
                  return ListTile(
                    title: Text(option),
                    onTap: () async {
                      await _handleSelection(option);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
