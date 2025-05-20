import 'dart:core';

class Helper {
  static bool isEmail(String email) {
    // Expresión regular para validar el formato de un correo electrónico
    final regex = RegExp(r'^[A-Za-z]+[\w-]?\.?([\w-]+)*@[\w-]+(\.[\w-]+)+$');
//    debugPrint("Helper.isEmail: ${regex.hasMatch(email)}");
    return regex.hasMatch(email);
  }
}
