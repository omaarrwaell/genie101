import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomeViewController extends GetxController {
  Rx<Icon> selectedIcon = const Icon(Icons.abc).obs;
  Rx<Icon> selectedTriggerIcon = const Icon(Icons.ac_unit_outlined).obs;
  List<String> names = ["Morning", "Night", "Music", "Movie", "Leaving"];
  List<Icon> icons = const [
    Icon(
      Symbols.sunny,
      size: 50,
      color: Colors.amber,
    ),
    Icon(
      Symbols.nights_stay,
      color: Colors.blueGrey,
      size: 50,
    ),
    Icon(
      Symbols.play_music,
      color: Colors.redAccent,
      size: 50,
    ),
    Icon(
      Icons.movie_outlined,
      color: Colors.deepPurple,
      size: 50,
    ),
    Icon(
      Symbols.key,
      color: Colors.teal,
      size: 50,
    )
  ];
  List<Icon> triggerIcons = const [
    Icon(
      Icons.thermostat_outlined,
      color: Color.fromARGB(255, 218, 209, 209),
      size: 30,
    ),
    Icon(
      Icons.air_outlined,
      color: Color.fromARGB(255, 218, 209, 209),
      size: 30,
    ),
    Icon(
      Icons.cases_outlined,
      color: Color.fromARGB(255, 218, 209, 209),
      size: 30,
    ),
    Icon(
      Icons.tv_outlined,
      color: Color.fromARGB(255, 218, 209, 209),
      size: 30,
    ),
    Icon(
      Icons.tv_off_outlined,
      color: Color.fromARGB(255, 218, 209, 209),
      size: 30,
    )
  ];
  List<String> rooms = [
    "Garden",
    "Living Room",
    "Bed Room",
    "Kitchen",
    "Bathroom"
  ];
  List<String> roomImages = [
    "assets/images/garden.jpeg",
    "assets/images/room_2.jpg",
    "assets/images/bedroom.jpeg",
    "assets/images/kitchen.jpeg",
    "assets/images/bathroom.jpeg",
  ];
}
