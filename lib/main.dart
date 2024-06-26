// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:mix_it/screens/home_page/home_page.dart';
import 'package:mix_it/utils/themes/custom_themes.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mix-It!',
      theme: CustomThemes.customDarkTheme,
      home: const HomePage(),
    );
  }
}
