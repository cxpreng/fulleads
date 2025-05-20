import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:full_leads_v01/views/screens/home/home_screen.dart';
import 'package:full_leads_v01/controllers/network_controller.dart';
import 'package:full_leads_v01/views/screens/login/login_screen.dart';
// import 'package:full_leads_v01/controllers/api.dart';
import 'package:full_leads_v01/views/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'dart:convert';
import 'package:full_leads_v01/helpers.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

//import '../views/theme.dart';

class LoginController extends GetxController {
  final Network network = Network();
  //  final Api api = Api();
  final token = GetSecureStorage().read('token');
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxString passwordError = ''.obs;
  final RxString emailError = ''.obs;
  final RxString butonText = 'INGRESO    '.obs;

  RxInt index = 0.obs;
  RxBool isLoggedIn = false.obs;
  void updateView(int i) {
    index.value = i;
  }

  @override
  void onInit() {
    super.onInit();
    if (token != null && token.isNotEmpty) {
      bool isExpired = JwtDecoder.isExpired(token);
      if (!isExpired) {
        butonText.value = 'INGRESO    ';
        isLoggedIn.value = true;
      }
    }
  }

  void logout() {
    butonText.value = 'INGRESO    ';
    isLoggedIn.value = false;
    GetSecureStorage().remove('token');
    Get.offAll(() => LoginScreen());
  }

  Future<void> validateAndSubmit() async {
    int err = 0;
    butonText.value = "CARGANDO...   ";
    if (emailController.text.isEmpty) {
      emailError.value = 'Correo no puede estar vacío';
      err++;
    } else if (!Helper.isEmail(emailController.text)) {
      emailError.value = 'Formato inválido';
      err++;
    } else {
      emailError.value = '';
    }
    if (passwordController.text.isEmpty) {
      err++;
      passwordError.value = 'Contraseña no puede estar vacío';
    } else {
      passwordError.value = '';
    }
    //* Verificamos si hubo errores
    if (err > 0) {
      butonText.value = 'INGRESO    ';
      return;
    }
    //* Si no hubo errores, procedemos a realizar el login
    final res = await network.performLogin(
      emailController.text,
      passwordController.text,
    );
    if (res != null) {
      //      debugPrint("RES: ------> $res");
      //      debugPrint("CODE: ------> ${res.statusCode}");
      //      debugPrint("RES.isOk: ------> ${res.isOk}");
      var body = json.decode(res.bodyString);
      //      debugPrint("SUCCESS: ------> $body");

      if (res.isOk) {
        debugPrint("🟢 SUCCESS: ========> $body");
        var token = body['access'];
        var user = body['user_id'];
        final box = GetSecureStorage(password: dotenv.env['GSS_PASS']);
        box.write("token", token);
        box.write("user", user);
        Get.off(HomeScreen());
      } else if (res.statusCode == 480) {
        customDialog(
          title: "Verificar Cuenta",
          text:
              "Al parecer su cuenta no se encuentra verificada. ¿Desea reenviar el enlace de verificación al e-mail provisto?",
          onConfirm: () {
            Get.back();
          },
          onCancel: () {
            debugPrint("verifyEmail: ENVIAR CORREO DE VERIFICACION!!!!!!!");
            Get.back();
          },
        );
        butonText.value = 'INGRESO    ';
        return;
      } else if (res.statusCode == 401) {
        customDialog(
          title: "Error de Autenticación",
          text: body['message'],
          onConfirm: () {
            debugPrint("🟢     🟢  Aceptar!!!!!!!!!!!!!!!!!");
            Get.back();
          },
        );
        return;
      } else if (res.statusCode == 400) {
        customDialog(
          title: "Error de Contraseña",
          text: body['message'],
          onConfirm: () {
            debugPrint("🟢    🟢 Aceptar!!!!!!!!!!!!!!!!!");
            Get.back();
          },
        );
        return;
      } else {
        butonText.value = 'INGRESO    ';
        return;
      }

      //      isLoggedIn.value = true;
      //      Get.offAll(HomeScreen());
    } else {
      debugPrint("🔴 🔴 🔴 LoginController.validateAndSubmit: res = $res");
    }
  }
}
