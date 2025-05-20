import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoggedIn = false.obs;

  Future<void> logout() async {
    isLoggedIn.value = false;
  }
}
