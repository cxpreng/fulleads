import 'package:full_leads_v01/controllers/login_controller.dart';
import 'package:full_leads_v01/views/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginInput extends StatelessWidget {
  const LoginInput({
    super.key,
    required this.hint,
    required this.loginController,
    required this.errorController,
  });
  final String hint;
  final LoginController loginController;
  final RxString errorController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* Input Field
        Obx(
          () => TextFormField(
            obscureText: (hint == 'Contraseña') ? true : false,
            enableSuggestions: (hint == 'Contraseña') ? false : true,
            autocorrect: (hint == 'Contraseña') ? false : true,
            controller:
                (hint == 'Contraseña')
                    ? loginController.passwordController
                    : loginController.emailController,
            decoration: InputDecoration(
              filled: false,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1.0),
              ),
              errorStyle: TextStyle(color: Colors.red, fontSize: 10),
              errorText:
                  (errorController.value.trim() == '')
                      ? null
                      : errorController.value,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.verde),
              ),
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }
}
