import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:rick_and_morty/models/character.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/models/location.dart';

class ApiServiceProvider with ChangeNotifier {
  final Dio _dio = Dio();
  late String location_value;
  List<Character> charactersList = [];
  List<Location> locationsList = [];
Color buttonColor_dead = Color.fromRGBO(255, 255, 255, 0.05);
Color buttonColor_Alive = Color.fromRGBO(255, 255, 255, 0.05);
Color buttonColor_unknown = Color.fromRGBO(255, 255, 255, 0.05);

  Future<List<Location>> fetchLocations() async {
    try {
      var allLocations = [];

      int page = 1;
      bool hasMorePages = true;
      var data;

      while (hasMorePages) {
        final response = await _dio
            .get('https://rickandmortyapi.com/api/location/?&page=$page');

        data = response.data['results'] as List<dynamic>;

        allLocations.addAll(data);

        final nextPageUrl = response.data['info']['next'];
        if (nextPageUrl != null) {
          page++;
        } else {
          hasMorePages = false;
        }
      }
      final locations =
          allLocations.map((json) => Location.fromJson(json)).toList();
      return locations;
    } catch (e) {
      throw Exception('Failed to fetch locations: $e');
    }
  }

  Future<List<Character>> fetchCharacters({String status = ""}) async {
    try {
      var allcharacter = [];

      int page = 1;
      bool hasMorePages = true;
      var data;

      while (hasMorePages) {
        final response = await _dio.get(
            "https://rickandmortyapi.com/api/character/?status=$status&page=$page");
        data = response.data['results'] as List<dynamic>;

        allcharacter.addAll(data);

        final nextPageUrl = response.data['info']['next'];
        if (nextPageUrl != null) {
          page++;
        } else {
          hasMorePages = false;
        }
      }
      final characters =
          allcharacter.map((json) => Character.fromJson(json)).toList();
      return characters;
    } catch (e) {
      throw Exception('Failed to fetch characters by location: $e');
    }
  }

  addItemCharacters(List<Character> charr) {
    charactersList.clear();
    charactersList.addAll(charr);
    notifyListeners();
  }

  addItemlocation(List<Location> charr) {
    locationsList.clear();
    locationsList.addAll(charr);
    notifyListeners();
  }

  setLocationvalue(String value) {
    location_value = value;
    notifyListeners();
  }
}
