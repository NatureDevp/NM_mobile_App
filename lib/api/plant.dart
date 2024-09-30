import 'dart:convert';
import 'dart:developer';

import 'package:naturemedix/api/base.dart';
import 'package:http/http.dart' as http;

Future fetchPlants() async {
  // Replace with your Laravel API endpoint
  final url = Uri.parse('$baseURL/api/plants');

  // Send the GET request
  final response = await http.get(url);

  log(response.statusCode.toString());
  // Check if the request was successful
  if (response.statusCode == 200) {
    var jsonData = await json.decode(response.body);
    log('[API]: Plants fetch success!.');
    return jsonData['data'];
  } else {
    throw Exception('Failed to load plants');
  }
}

Future fetchRemedies() async {
  // Replace with your Laravel API endpoint
  final url = Uri.parse('$baseURL/api/remedies');

  // Send the GET request
  final response = await http.get(url);

  log(response.statusCode.toString());
  // Check if the request was successful
  if (response.statusCode == 200) {
    var jsonData = await json.decode(response.body);
    log('[API]: Remedies fetch success!.');
    print(jsonData['data']);
    return jsonData['data'];
  } else {
    throw Exception('Failed to load remedies');
  }
}
