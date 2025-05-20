import 'package:full_leads_v01/controllers/login_controller.dart';
import 'package:full_leads_v01/views/theme.dart';
import 'package:full_leads_v01/views/screens/login/login_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends GetView<LoginController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        //? Login CardBox
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white, // Color de fondo del Container
                boxShadow: [
                  BoxShadow(
                    color: AppColor.plomo, // Color de la sombra
                    blurRadius: 40.0, // Radio de desenfoque
                    offset: Offset(0, 0), // Desplazamiento en X y Y
                  ),
                ],
              ),
              child: Form(
                child: Column(
                  children: [
                    //* TITULO
                    Text(
                      'Ingreso',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    LoginInput(
                      hint: 'E-mail',
                      loginController: controller,
                      errorController: controller.emailError,
                    ),
                    LoginInput(
                      hint: 'Contraseña',
                      loginController: controller,
                      errorController: controller.passwordError,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
        //? Boton Ingreso
        Positioned(bottom: 50, child: NewWidget(controller: controller)),
      ],
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({super.key, required this.controller});

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColor.verde),
        foregroundColor: WidgetStateProperty.all(AppColor.blanco),
        elevation: WidgetStateProperty.all(20.0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
      onPressed: controller.validateAndSubmit,
      icon: Icon(Icons.login),
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
        child: Obx(
          () => Text(
            controller.butonText.value,
            style: TextStyle(fontSize: Elements.textReg(context)),
          ),
        ),
      ),
    );
  }
}
