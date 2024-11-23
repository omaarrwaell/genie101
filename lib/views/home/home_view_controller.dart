import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomeViewController extends GetxController {
  Rx<Icon> selectedIcon = const Icon(Icons.abc).obs;
  Rx<IconData> selectedTriggerIcon = Icons.ac_unit_outlined.obs;
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
  List<IconData> triggerIcons = const [
    Icons.thermostat_outlined,
    Icons.air_outlined,
    Icons.cases_outlined,
    Icons.tv_outlined,
    Icons.tv_off_outlined,
  ];
  List<String> rooms = [
    "Garden",
    "Living Room",
    "Bed Room",
    "Kitchen",
    "Bathroom",
    ""
  ];
  List<String> roomImages = [
    "assets/images/garden.jpeg",
    "assets/images/room_2.jpg",
    "assets/images/bedroom.jpeg",
    "assets/images/kitchen.jpeg",
    "assets/images/bathroom.jpeg",
    ""
  ];
}
