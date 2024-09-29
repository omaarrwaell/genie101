import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:get/get.dart';

class ScenesViewController extends GetxController {
  List<String> utilities = [
    'Fan',
    'Television',
    "Speakers",
    "Light",
    "Conditioner"
  ];
  List<Icon> utilityIcons = const [
    Icon(
      Symbols.mode_fan,
      size: 35,
      color: Colors.white,
    ),
    Icon(
      Symbols.tv,
      size: 35,
      color: Colors.white,
    ),
    Icon(
      Symbols.speaker,
      size: 35,
      color: Colors.white,
    ),
    Icon(
      Symbols.lightbulb,
      size: 35,
      color: Colors.white,
    ),
    Icon(
      Symbols.ac_unit,
      size: 35,
      color: Colors.white,
    ),
  ];
}
