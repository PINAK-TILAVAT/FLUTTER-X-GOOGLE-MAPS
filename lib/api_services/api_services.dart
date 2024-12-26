import 'dart:convert';

import 'package:flutter_maps/api_model/places_from_cordinates.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<PlaceFromCordinates> placeFromCordinates(
      double lat, double lng) async {
    Uri url = Uri.parse(
        "https://maps.gomaps.pro/maps/api/geocode/json?latlng=$lat,$lng&key=AlzaSyj9t-RMMe3gpGvHBomv778YCfQNd6Q8IaE");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return PlaceFromCordinates.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("NOT WORKING BRO");
    }
  }
}
