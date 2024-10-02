import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:get/get.dart';

class ScenesViewController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxInt acTemp = 19.obs;
  Rx<Color> selectedColor = Colors.transparent.obs;
  List<String> utilities = [
    'Fan',
    "Conditioner",
    "Light",
    'Television',
    "Speakers",
  ];
  List<IconData> utilityIcons = const [
    Symbols.mode_fan,
    Symbols.ac_unit,
    Symbols.lightbulb,
    Symbols.tv,
    Symbols.speaker,
  ];

  void changeIndex(int index) {
    currentIndex(index);
  }

  void monitorAc(int temp) {
    acTemp(temp);
  }

  void monitorColor(Color color) {
    selectedColor(color);
  }
}
