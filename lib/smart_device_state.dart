import 'package:flutter/material.dart';

class SmartDeviceState extends ChangeNotifier {
  List<List<dynamic>> mySmartDevices = [
    ["Smart Light", "lib/icons/lightbulb.png", true],
    ["Smart AC", "lib/icons/aircon.png", false],
    ["Smart TV", "lib/icons/tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
  ];

  void toggleDevicePower(int index, bool value) {
    mySmartDevices[index][2] = value;
    notifyListeners();
  }

  void toggleAllDevices(bool value) {
    for (var device in mySmartDevices) {
      device[2] = value;
    }
    notifyListeners();
  }
}
