// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:full_leads_v01/views/theme.dart';
import 'package:full_leads_v01/views/screens/login/login_screen.dart';
import 'package:full_leads_v01/views/screens/home/home_screen.dart';
import 'package:full_leads_v01/controllers/login_controller.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await GetSecureStorage.init(password: dotenv.env['GSS_PASS']);
  final box = GetSecureStorage(password: dotenv.env['GSS_PASS']);
  box.write('apiToken', dotenv.env['API_KEY']);
  box.write('apiURL', dotenv.env['API_URL']);

  final LoginController authController = Get.put(LoginController());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      GetMaterialApp(
        title: 'Full Leads',
        theme: ThemeData(fontFamily: 'Raleway', useMaterial3: false),
        debugShowCheckedModeBanner: false,
        home: Obx(() {
          if (authController.isLoggedIn.value) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        }),
        getPages: [
          GetPage(name: '/login', page: () => LoginScreen()),
          GetPage(name: '/home', page: () => HomeScreen()),
        ],
      ),
    );
  });
}
