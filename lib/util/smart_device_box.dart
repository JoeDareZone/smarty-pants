import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;

  const SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(24)),
            child: Column(
              children: [
                Image.asset(
                  iconPath,
                  height: 65,
                ),
                Row(
                  children: [
                    Text(smartDeviceName),
                    CupertinoSwitch(value: false, onChanged: (value) {})
                  ],
                )
              ],
            )));
  }
}
