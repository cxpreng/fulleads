import 'package:flutter/material.dart';
import 'dart:core';

class AppColor {
  static const Color verde = Color(0xFF29bf04);
  static const Color azulClaro = Color(0xFF3370cc);
  static const Color celeste = Color(0xFF87B2F3);
  static const Color azul = Color(0xFF0e4277);
  static const Color amarillo = Color(0xFFffdb00);
  static const Color naranjo = Color(0xFFffc100);
  static const Color blanco = Color(0xFFFFFFFF);
  static const Color cafe = Color(0xFFddb10f);
  static const Color rojo = Color(0xFFC20A0A);
  static const Color negro = Color(0xFF000000);
  static const Color plomo = Color(0xFF2F2F2F);
}

class Elements {
  static double thirtyPct(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.3;
  }

  static double tenPct(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.1;
  }

  static double fivePct(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.05;
  }

  static double twoPct(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.02;
  }

  static double textBig(BuildContext context) {
    return (MediaQuery.of(context).size.height * 0.017 + 18).floor().toDouble();
  }

  static double textMed(BuildContext context) {
    return (MediaQuery.of(context).size.height * 0.015 + 8).floor().toDouble();
  }

  static double textReg(BuildContext context) {
    return (MediaQuery.of(context).size.height * 0.012 + 6).floor().toDouble();
  }

  static double textSm(BuildContext context) {
    return (MediaQuery.of(context).size.height * 0.01 + 4).floor().toDouble();
  }
}
