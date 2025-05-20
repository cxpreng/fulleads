import 'package:full_leads_v01/controllers/login_controller.dart';
import 'package:full_leads_v01/views/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Recovery extends StatelessWidget {
  Recovery({super.key});
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        //? Formulario
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
              child: Column(
                children: const [
                  //* texto 'Ingreso'
                  Text(
                    'Recuperar Contraseña',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 25),
                  //* Input E-mail
                  TextField(
                    cursorColor: AppColor.verde,
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.verde),
                      ),
                      hintText: 'E-mail',
                    ),
                  ),

                  SizedBox(height: 40),
                ],
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          child: IconButton(
            onPressed: () {
              loginController.updateView(0);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        Positioned(
          bottom: 50,
          child: ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(AppColor.verde),
              foregroundColor: WidgetStateProperty.all(AppColor.blanco),
              elevation: WidgetStateProperty.all(20.0),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  // Change your radius here
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
            onPressed: () => {debugPrint("Click XX!!!!!!!!")},
            icon: Icon(Icons.email_outlined),
            label: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: Text(
                'RECUPERAR     ',
                style: TextStyle(fontSize: Elements.textReg(context)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
