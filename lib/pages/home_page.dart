import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarty_pants/util/smart_device_box.dart';

import '../smart_device_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final smartDeviceState = Provider.of<SmartDeviceState>(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home,",
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                  Text("JOE", style: GoogleFonts.bebasNeue(fontSize: 72)),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  final allOn = smartDeviceState.mySmartDevices
                      .any((device) => !device[2]);
                  smartDeviceState.toggleAllDevices(allOn);
                },
                child: Text(
                  "Toggle All",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: smartDeviceState.mySmartDevices.length,
                padding: const EdgeInsets.all(25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  final device = smartDeviceState.mySmartDevices[index];
                  return SmartDeviceBox(
                    smartDeviceName: device[0],
                    iconPath: device[1],
                    powerOn: device[2],
                    onChanged: (val) {
                      smartDeviceState.toggleDevicePower(index, val);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
