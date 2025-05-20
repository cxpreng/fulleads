/* // ignore_for_file: unused_field, prefer_const_constructors, unused_import, avoid_print, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/location_controller.dart';

class SplashView extends GetView {
  final locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        // width: double.infinity,
        // height: double.infinity,
        child: Container(
          color: Color(0xFFFFC600),
          // width: double.infinity,
          // height: double.infinity,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/logo.02.w900.png',
                height: 200, fit: BoxFit.fill),
          ),
          Obx(
            () => Text(locationController.lat.value),
          ),
          /* Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 60),
            child: Image.asset('assets/images/logo.blanco.png',
                height: 150, fit: BoxFit.fill),
          ), */
        ],
      )
    ]);
  }
}
 */