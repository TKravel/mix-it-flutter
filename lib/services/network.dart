// ignore: unused_import
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Functionality for making http requests to outside sources
class Network {
  /// API base url
  final String _authority = 'www.thecocktaildb.com';

  /// API key for extended functionality
  final String _apiKey = dotenv.env['API_KEY']!;

  /// Make requests to the cocktaildb API
  ///
  /// [url] The API url to hit
  /// [params] Optional packaged API params
  ///
  /// Returns response.body
  apiPostRequest(String url, Map<String, String>? params) async {
    String routeBuilder = 'api/json/$_apiKey$url';
    Uri endPoint = Uri.https(_authority, routeBuilder, params);
    var response = await http.get(endPoint);
    // log('Response status: $url ${response.statusCode}');
    // log('Response body: ${response.body}');
    return response.body;
  }

  /// Make http requests
  ///
  /// [url] The url to hit
  /// [bodyPkg] Request body
  ///
  /// Returns response.body
  postRequest(Uri url, Map<String, dynamic> bodyPkg) async {
    var response = await http.post(url, body: bodyPkg);
    return response;
  }
}
