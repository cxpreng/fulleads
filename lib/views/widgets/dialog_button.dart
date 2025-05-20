import 'package:full_leads_v01/views/theme.dart';
import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.onPressed,
    this.accept = true,
    this.upper = false,
    this.weight = FontWeight.w400,
  });

  final bool accept;
  final bool upper;
  final FontWeight weight;
  final VoidCallback onPressed;

  String get text =>
      accept
          ? upper
              ? 'ACEPTAR'
              : 'Aceptar'
          : upper
          ? 'CANCELAR'
          : 'Cancelar';

  //- Esto permite tener colores diferentes dependiendo de si es aceptar o cancelar
  Color get background => accept ? AppColor.verde : AppColor.verde;
  Color get foreground => accept ? AppColor.blanco : AppColor.blanco;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(background),
        foregroundColor: WidgetStateProperty.all(foreground),
        elevation: WidgetStateProperty.all(20.0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontWeight: weight)),
    );
  }
}
