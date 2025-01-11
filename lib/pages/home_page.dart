import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarty_pants/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  List mySmartDevices = [
    ["Smart Light", "lib/icons/lightbulb.png", true],
    ["Smart AC", "lib/icons/aircon.png", false],
    ["Smart TV", "lib/icons/tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", false]
  ];

  void powerSwitchChanged(bool val, int index) => {
        setState(() {
          mySmartDevices[index][2] = val;
        })
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
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
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Home,",
                      style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                    ),
                    Text("JOE", style: GoogleFonts.bebasNeue(fontSize: 72)),
                  ],
                )),
            const SizedBox(height: 25),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Divider(color: Colors.grey[400], thickness: 1)),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Text(
                  "Smart Devices",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.grey[800]),
                )),
            Expanded(
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: mySmartDevices.length,
                    padding: const EdgeInsets.all(25),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: (context, index) {
                      return SmartDeviceBox(
                        smartDeviceName: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerOn: mySmartDevices[index][2],
                        onChanged: (val) => powerSwitchChanged(val, index),
                      );
                    }))
          ],
        )));
  }
}
