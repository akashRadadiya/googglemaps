import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:googglemaps/Screen/googlemapscreen/locationcontroller.dart';
import 'package:googglemaps/Screen/search_plases.dart';

import 'Google_Map_Screeen.dart';

class HomeView extends GetView<HomeController> {
  var Controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.location_on,
                color: Colors.yellow,
                size: 250,
              ),
              Text(
                'GOOOGLE MAPS',
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 30,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black),
              ),
              /*       const SizedBox(
                  height: 4,
                ),
                const Text(
                  'Location',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 30,
                      decoration: TextDecoration.underline),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                      () => Text(
                    controller.latitude.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Obx(
                      () => Text(
                    controller.longitude.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Obx(
                      () => Text(
                    controller.address.value,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),*/
            ],
          ),
        ),
      ),

      floatingActionButton: SpeedDial(
          icon: Icons.keyboard_double_arrow_up_rounded,
          activeIcon: Icons.keyboard_double_arrow_down,
          spacing: 3,
          backgroundColor: Colors.green,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.location_on_outlined),
              label: 'Current location',
              backgroundColor: Colors.greenAccent,
              onTap: () {
                Get.to(const GoogleMapScreen());
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.email),
              label: 'Search plase',
              backgroundColor: Colors.greenAccent,
              onTap: () {
               Get.to(SharchPlascesScreen());
              },
            ),
          ]),
    );
  }
}
