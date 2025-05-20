import 'package:full_leads_v01/controllers/network_controller.dart';
import 'package:full_leads_v01/views/theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final Network network = Get.put(Network());

  var lastScannedCode = ''.obs;

  //TODO: Implementar pausa de 3 segundos entre cada escaneo

  void handleQRCode(String code) async {
    if ((code.length >= 22 && code.length <= 23) &&
        code != lastScannedCode.value) {
      lastScannedCode.value = code;
      final response = await network.sendLead(code);
      if (response != null && response.statusCode == 200) {
        Get.snackbar(
          "Nuevo ",
          "Lead agregado correctamente",
          backgroundColor: AppColor.verde,
          colorText: AppColor.blanco,
          duration: 3.seconds,
          icon: Icon(Icons.check),
          shouldIconPulse: true,
          animationDuration: 1.seconds,
          borderWidth: 1.0,
          borderColor: AppColor.blanco,
        );
      } else {
        Get.snackbar(
          "Error",
          "No se pudo enviar el código",
          backgroundColor: AppColor.verde,
          colorText: AppColor.blanco,
          duration: 3.seconds,
          icon: Icon(Icons.error),
          shouldIconPulse: true,
          animationDuration: 1.seconds,
          borderWidth: 1.0,
          borderColor: AppColor.blanco,
        );
      }
    }
  }
}
