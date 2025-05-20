import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_secure_storage/get_secure_storage.dart';

class Network extends GetConnect {
  /*   @override
  void onInit() {
    httpClient.baseUrl = 'https://api.alclavo.buzz/auth';
    super.onInit();
  } */

  final String apiToken = GetSecureStorage().read('apiToken');
  final String mainUrl = GetSecureStorage().read('apiURL');

  final Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'X-Api-Token': GetSecureStorage().read('apiToken'),
  };
  Future<dynamic> performLogin(String username, String password) async {
    final String loginUrl = "$mainUrl/auth/login";

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Api-Token': apiToken,
    };

    Map<String, String> userData = {'email': username, 'pass': password};

    try {
      Response response = await post(loginUrl, userData, headers: headers);
      /*       debugPrint("performLogin response.bodyString: ${response.bodyString}");
      debugPrint("performLogin responseStatusText: ${response.statusText}");
      debugPrint("performLogin responseStatusCode: ${response.statusCode}");
      debugPrint("performLogin responseisOk: ${response.isOk}"); */
      if (response.statusCode.runtimeType == int) {
        return response;
      }
    } catch (error) {
      debugPrint("🔴 🔴 🔴ERROR: --------------> $error");
    }
    /*     debugPrint("performLogin: $response");
    if (response.statusCode == 200) {
      debugPrint("success");
      return response.body;
    } else {
      debugPrint("error");
      return false;
    } */
  }

  getService() async {
    Map<String, dynamic> objetoJSON = {};
    return objetoJSON;
  }

  Future<Response?> sendLead(String code) async {
    final String token = await GetSecureStorage().read('token');
    if (token.isNotEmpty == true) {
      final String url = "$mainUrl/v1/lead";
      //       debugPrint("🟢🟢🟢=======>TOKEN: $token");
      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-Api-Token': apiToken,
      };

      try {
        final response = await post(url, {'code': code}, headers: headers);

        debugPrint("🟢🟢=======>Lead enviado: ${response.body}");
        return response;
      } catch (e) {
        debugPrint("🔴🔴🔴=======>Error enviando lead: $e");
        return null;
      }
    } else {
      Get.snackbar("Error", "Intente iniciar sesión nuevamente");
      return null;
    }
  }
}

class User {
  late String email;
  late String pass;

  User({required this.email, required this.pass});

  // fromJson
  factory User.fromJson(dynamic json) {
    return User(email: json['email'], pass: json['pass']);
  }
  // listFromJson
  static List<User> listFromJson(dynamic json) {
    return List<User>.from(json.map((user) => User.fromJson(user)));
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {'email': email, 'pass': pass};
  }

  // toString
  @override
  String toString() {
    return 'User{email: $email, pass: $pass}';
  }
}
