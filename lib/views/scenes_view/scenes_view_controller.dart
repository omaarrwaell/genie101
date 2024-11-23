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
  Rx<bool> isOn = false.obs;
  @override
  void onInit() async {
    var res = await _deviceProvider.getDevices();
    devices.value = res.body!;
    print(devices());
    conditioner.value = devices().firstWhere((d) => d.name == 'Conditioner');
    acTemp(conditioner().status!["temperature"]);
    isOn(conditioner().status!["state"] == "on");
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
        isOn(conditioner().status!["state"] == "on");
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
}
