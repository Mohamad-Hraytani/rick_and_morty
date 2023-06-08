import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/screens/character_details_screen.dart';
import 'package:rick_and_morty/screens/character_list_screen.dart';



import 'package:rick_and_morty/screens/location_list_screen.dart';
import 'package:rick_and_morty/services/ApiServiceProvider.dart';
void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return     MaterialApp(
    scrollBehavior: MaterialScrollBehavior().copyWith(
    dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
  ),
      debugShowCheckedModeBanner: false,
      home:
      MultiProvider(
        providers:[ 

ChangeNotifierProvider( 
        create: (_) => ApiServiceProvider(), 
         child: CharacterListScreen()),

ChangeNotifierProvider( 
        create: (_) => ApiServiceProvider(), 
         child: CharacterDetailsScreen(character: Character(gender: '', imageUrl: '', name: '', origin: null, species: '', status: '', type: ''),)),

ChangeNotifierProvider( 
        create: (_) => ApiServiceProvider(), 
         child: LocationListScreen()),

        ],
           child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LocationListScreen()),
           
           
           
           
           
           
           
    )
  
    );
  }
}

