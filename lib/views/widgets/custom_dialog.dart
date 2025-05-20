import 'package:full_leads_v01/views/widgets/dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> customDialog({
  required String title,
  required String text,
  required VoidCallback onConfirm,
  VoidCallback? onCancel,
  String cancelText = 'Cancelar',
  String confirmText = 'Aceptar',
}) {
  //? Creamos una lista de widgets para actions
  final actions = <Widget>[];

  if (onCancel != null) {
    actions.add(DialogButton(accept: false, onPressed: onCancel));
  }

  actions.add(DialogButton(onPressed: onConfirm));

  return Get.defaultDialog(
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    content: Text(text, textAlign: TextAlign.center),
    title: title,
    //    middleText: text,
    actions: actions,
  );
}
