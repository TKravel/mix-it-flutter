// ignore: unused_import
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Network {
  final String _authority = 'www.thecocktaildb.com';
  final String _apiKey = dotenv.env['API_KEY']!;

  postRequest(String url, Map<String, String>? params) async {
    String routeBuilder = 'api/json/$_apiKey$url';
    Uri endPoint = Uri.https(_authority, routeBuilder, params);
    var response = await http.get(endPoint);
    // print('Response status: $url ${response.statusCode}');
    // print('Response body: ${response.body}');
    return response.body;
  }
}
