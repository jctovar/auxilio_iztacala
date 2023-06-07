import 'package:flutter/material.dart';

class Environment {
  static String appName = 'Auxilio iztacala';
  static Color backgroundColor = const Color(0xfff0f0f0);
  static Color buttonColor = Colors.blue;

  static const apiUrl = 'https://idril.iztacala.unam.mx/iztacala/';

  static inputDecoration(String label, String hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      border: const OutlineInputBorder(),
    );
  }

  static showSnackbar(BuildContext context, String text, [Color? color]) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color,
      duration: const Duration(seconds: 1),
      content: Text(text),
    ));
  }

  // Regular expressions used in formbuilder
  static String curp =
      '^[A-Z][A,E,I,O,U,X][A-Z]{2}[0-9]{2}[0-1][0-9][0-3][0-9][M,H][A-Z]{2}[B,C,D,F,G,H,J,K,L,M,N,Ñ,P,Q,R,S,T,V,W,X,Y,Z]{3}[0-9,A-Z][0-9]';
  static String rfc =
      '^[A-Z][A,E,I,O,U,X][A-Z]{2}[0-9]{2}[0-1][0-9][0-3][0-9][0-9,A-Z]{3}';
  static String phone = '^[0-9]{10}\$';
  static String module = '^[0-9]{4}\$';
  static String period = '^20[1-3][0-9]-[1-2]\$';
}
