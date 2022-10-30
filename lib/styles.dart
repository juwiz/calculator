import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';

Widget sText(String text, double size, Color color) {
  return Text(text,
      style: GoogleFonts.lato(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w700,
      ));
}

class ColorTheme {
  final Color backgroundDark;
  final Color backgroundLight;
  final Color textColor;
  final Color operatorColor;
  final Color buttomColor;
  final Color others;

  const ColorTheme({
    required this.backgroundDark,
    required this.backgroundLight,
    required this.textColor,
    required this.operatorColor,
    required this.buttomColor,
    required this.others,
  });

  static const ColorTheme lightMode = ColorTheme(
    backgroundDark: Color.fromARGB(255, 200, 200, 235),
    backgroundLight: Color.fromARGB(255, 235, 235, 255),
    textColor: Color.fromARGB(255, 25, 25, 55),
    operatorColor: Color.fromARGB(255, 200, 80, 80),
    buttomColor: Color.fromARGB(255, 215, 215, 235),
    others: Color.fromARGB(150, 190, 190, 190),
  );

  static const ColorTheme darkMode = ColorTheme(
    backgroundDark: Color.fromARGB(255, 25, 25, 55),
    backgroundLight: Color.fromARGB(255, 40, 40, 70),
    textColor: Color.fromARGB(255, 235, 235, 255),
    operatorColor: Color.fromARGB(255, 200, 80, 80),
    buttomColor: Color.fromARGB(255, 30, 30, 60),
    others: Color.fromARGB(150, 190, 190, 190),
  );
}

class ColorsLight {
  Color backgroundDark = Color.fromARGB(255, 184, 184, 219);
  Color backgroundLight = Color.fromARGB(255, 225, 225, 243);
  Color textColor = const Color.fromARGB(255, 25, 25, 55);
  Color operatorColor = const Color.fromARGB(255, 200, 80, 80);
  Color buttomColor = const Color.fromARGB(255, 215, 215, 235);
  Color others = const Color.fromARGB(150, 190, 190, 190);
}

class ColorsDark {
  Color backgroundDark = const Color.fromARGB(255, 25, 25, 55);
  Color backgroundLight = const Color.fromARGB(255, 40, 40, 70);
  Color textColor = const  Color.fromARGB(255, 225, 225, 243);
  Color operatorColor = const Color.fromARGB(255, 200, 80, 80);
  Color buttomColor = const Color.fromARGB(255, 30, 30, 60);
  Color others = const Color.fromARGB(150, 190, 190, 190);
}
