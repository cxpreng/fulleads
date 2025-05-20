import 'package:full_leads_v01/views/screens/login/login.dart';
import 'package:full_leads_v01/views/screens/login/recovery.dart';
import 'package:full_leads_v01/views/screens/login/register.dart';
import 'package:flutter/material.dart';
import 'package:full_leads_v01/views/theme.dart';
import 'package:full_leads_v01/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController loginController = Get.put(LoginController());
  // or "Get.lazyPut(()=>LoginController())"
  @override
  Widget build(BuildContext context) {
    //    print("SCREEN HEIGHT:  ${Elements.thirtyPct(context)}");
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.blanco,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.blanco,
                AppColor.blanco,
              ], // Colores del degradado
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //* Spacer
                SizedBox(height: Elements.fivePct(context)),
                //? TEXT TITULO
                /* Text(
                  'Full Leads',
                  style: TextStyle(
                    fontSize: Elements.textBig(context),
                    color: AppColor.verde,
                    fontWeight: FontWeight.w100,
                  ),
                  textAlign: TextAlign.center,
                ), */
                //* Spacer
                SizedBox(height: Elements.twoPct(context)),
                //? LOGO PRINCIPAL
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: Elements.thirtyPct(context),
                    fit: BoxFit.contain,
                  ),
                ),
                //? LOGIN CARD FORM
                Container(
                  height: 360,
                  padding: EdgeInsets.all(Elements.fivePct(context)),
                  child: Obx(() {
                    if (loginController.index.value == 2) {
                      return Register();
                    } else if (loginController.index.value == 3) {
                      return Recovery();
                    } else {
                      return Login();
                    }
                  }),
                ),
                //? REGISTRO / RECOVERY
                Container(
                  padding: EdgeInsets.only(bottom: Elements.fivePct(context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          loginController.updateView(2);
                        },
                        child: Text(
                          'Registro',
                          style: TextStyle(
                            fontSize: Elements.textMed(context),
                            color: AppColor.verde,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Text(
                        ' / ',
                        style: TextStyle(
                          fontSize: Elements.textMed(context),
                          color: AppColor.verde,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      //? Recuperar Clave
                      GestureDetector(
                        onTap: () {
                          //                            loginController.activeWidget.value = Recovery();
                          loginController.updateView(3);
                        },
                        child: Text(
                          'Olvidé Mi Clave',
                          style: TextStyle(
                            fontSize: Elements.textMed(context),
                            color: AppColor.verde,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w100,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
