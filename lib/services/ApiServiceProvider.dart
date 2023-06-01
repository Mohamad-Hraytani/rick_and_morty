import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/%20location.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:provider/provider.dart';

class ApiServiceProvider  with ChangeNotifier{
  final Dio _dio = Dio();
late String location_value ;
List<Character> charactersList= [];
List<Location> locationsList= [];

  Future<List<Location>> fetchLocations() async {
    try {

 var allLocations = [];

  int page = 1;
  bool hasMorePages = true;
      var data ;
    
  while (hasMorePages) {
      final response = await _dio.get('https://rickandmortyapi.com/api/location/?&page=$page');


       data = response.data['results'] as List<dynamic>;

      allLocations.addAll(data);

      final nextPageUrl = response.data['info']['next'];
      if (nextPageUrl != null) {
        page++;
      } else {
        hasMorePages = false;
      }
    } 
 final locations = allLocations.map((json) => Location.fromJson(json)).toList();
      return locations;








    }
     catch (e) {
      throw Exception('Failed to fetch locations: $e');
    }
  }

  Future<List<Character>> fetchCharacters({String status = ""}) async {
    try {


 var allcharacter = [];

  int page = 1;
  bool hasMorePages = true;
      var data ;
    
  while (hasMorePages) {

 final response = await _dio.get("https://rickandmortyapi.com/api/character/?status=$status&page=$page");
     data = response.data['results'] as List<dynamic>;


      allcharacter.addAll(data);

      final nextPageUrl = response.data['info']['next'];
      if (nextPageUrl != null) {
        page++;
      } else {
        hasMorePages = false;
      }
    } 
      final characters = allcharacter.map((json) => Character.fromJson(json)).toList();
      return characters;

    } catch (e) {
      throw Exception('Failed to fetch characters by location: $e');
    }
  }


addItemCharacters(List<Character> charr ){
charactersList.clear();
 charactersList.addAll(charr);
notifyListeners();

}
addItemlocation(List<Location> charr ){
locationsList.clear();
 locationsList.addAll(charr);
notifyListeners();

}


setLocationvalue(String value){

location_value = value;
notifyListeners();


}





}
/*       var data ;
var data2 = []; 
      for(int i=1 ; i<=7 ; i++){
      final response = await _dio.get('https://rickandmortyapi.com/api/location/?&page=$i"');
       data = response.data['results'] as List<dynamic>;
         data2.addAll(data);
      
      
      }
      final locations = data2.map((json) => Location.fromJson(json)).toList();
      return locations; */