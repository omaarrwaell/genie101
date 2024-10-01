import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:get/get.dart';

class ScenesViewController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxInt acTemp = 19.obs;
  List<String> utilities = [
    'Fan',
    "Conditioner",
    "Speakers",
    "Light",
    'Television',
  ];
  List<IconData> utilityIcons = const [
    Symbols.mode_fan,
    Symbols.ac_unit,
    Symbols.tv,
    Symbols.speaker,
    Symbols.lightbulb,
  ];

  void changeIndex(int index) {
    currentIndex(index);
  }

  void monitorAc(int temp) {
    acTemp(temp);
  }
}
