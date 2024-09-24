import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  Rx<Icon> selectedIcon = Icon(Icons.abc).obs;
  List<String> names = ["Morning", "Night", "Music", "Movie", "Leaving"];
  List<Icon> icons = const [
    Icon(
      Icons.wb_sunny_rounded,
      size: 50,
      color: Colors.amber,
    ),
    Icon(
      Icons.nights_stay_rounded,
      color: Colors.blueGrey,
      size: 50,
    ),
    Icon(
      Icons.music_note_sharp,
      color: Colors.redAccent,
      size: 50,
    ),
    Icon(
      Icons.movie_filter_sharp,
      color: Colors.deepPurple,
      size: 50,
    ),
    Icon(
      Icons.exit_to_app_sharp,
      color: Colors.teal,
      size: 50,
    )
  ];
}
