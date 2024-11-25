import 'package:flutter/material.dart';
import 'package:genie101/Dtos/command_dto.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:genie101/providers/device_provider.dart';

import 'package:get/get.dart';

import '../../models/device.dart';

class ScenesViewController extends GetxController {
  final _deviceProvider = Get.put(DeviceProvider());
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
  RxList<Device> devices = <Device>[].obs;
  Rx<Device> conditioner = Device.onInit({}).obs;
  Rx<Device> hue = Device.onInit({}).obs;
  Rx<bool> isAcOn = false.obs;
  Rx<bool> isHueOn = false.obs;
  @override
  void onInit() async {
    var res = await _deviceProvider.getDevices();
    devices.value = res.body!;
    conditioner.value = devices().firstWhere((d) => d.name == 'Conditioner');
    hue.value = devices().firstWhere((d) => d.name == 'Hue');
    acTemp(conditioner().status!["temperature"]);
    isAcOn(conditioner().status!["state"] == "on");
    selectedColor(
        Color(int.parse(hue().status!["color"].replaceFirst('#', '0xff'))));
    isHueOn(hue().status!["state"] == "on");
    super.onInit();
  }

  void changeIndex(int index) {
    currentIndex(index);
  }

  void monitorAc(int temp) {
    acTemp(temp);
  }

  void monitorColor(Color color) {
    selectedColor(color);
  }

  Future<void> toggleAc() async {
    try {
      var response = await _deviceProvider.controlDevice(
        CommandDto(command: "toggle", payload: {
          "state": conditioner().status!["state"] == "on" ? "off" : "on"
        }).toJson(),
        conditioner().id.toString(),
      );
      if (response.isOk) {
        conditioner.value.status!["state"] =
            conditioner().status!["state"] == "on" ? "off" : "on";
        isAcOn(conditioner().status!["state"] == "on");
        Get.snackbar("Success", response.body!.message);
      }
    } catch (_) {}
  }

  Future<void> fireAc() async {
    try {
      var response = await _deviceProvider.controlDevice(
          CommandDto(
              command: "update",
              payload: {"state": "on", "temperature": acTemp.value}).toJson(),
          conditioner().id.toString());
      if (response.isOk) {
        Get.snackbar("Success", response.body!.message);
      }
    } catch (_) {}
  }

  Future<void> toggleHue() async {
    try {
      var response = await _deviceProvider.controlDevice(
        CommandDto(command: "toggle", payload: {
          "state": hue().status!["state"] == "on" ? "off" : "on"
        }).toJson(),
        hue().id.toString(),
      );
      if (response.isOk) {
        hue.value.status!["state"] =
            hue().status!["state"] == "on" ? "off" : "on";
        isHueOn(hue().status!["state"] == "on");
        Get.snackbar("Success", response.body!.message);
      }
    } catch (_) {}
  }

  Future<void> fireHue() async {
    try {
      var response = await _deviceProvider.controlDevice(
        CommandDto(command: "update", payload: {
          "state": hue().status!["state"],
          "color": "#${selectedColor.value.value.toRadixString(16)}"
        }).toJson(),
        hue().id.toString(),
      );
      if (response.isOk) {
        Get.snackbar("Success", response.body!.message);
      }
    } catch (_) {}
  }
}
